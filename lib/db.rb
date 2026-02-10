# frozen_string_literal: true

# ============================================================================
# Database — SQLite progress tracking
# ============================================================================
#
# Tables:
#   problems  — one row per problem file, seeded on startup
#   runs      — append-only log of every test run
#
# Status (2 states):
#   todo — not yet solved (test count shows progress)
#   pass — all tests green on the latest run
#
# first_pass is a trophy timestamp — the FIRST time you solved it.
# It never gets cleared, even if you revert code later.
# ============================================================================

module HelloLeet
  HAS_SQLITE =
    begin
      require "sqlite3"
      true
    rescue LoadError
      false
    end

  DB_PATH = File.join(File.expand_path("..", __dir__), "progress.db")

  module DB
    ROOT = File.expand_path("..", __dir__)

    # -- Setup ---------------------------------------------------------------

    def self.open
      return nil unless HAS_SQLITE

      db = SQLite3::Database.new(DB_PATH)
      create_tables(db)
      seed(db)
      db
    end

    def self.create_tables(db)
      db.execute_batch <<~SQL
        CREATE TABLE IF NOT EXISTS problems (
          file        TEXT PRIMARY KEY,
          pattern     TEXT NOT NULL,
          problem     TEXT NOT NULL,
          difficulty  TEXT,
          status      TEXT DEFAULT 'todo',
          first_pass  DATETIME,
          last_run    DATETIME,
          tests       INTEGER DEFAULT 0,
          failures    INTEGER DEFAULT 0
        );

        CREATE TABLE IF NOT EXISTS runs (
          file        TEXT NOT NULL,
          pattern     TEXT NOT NULL,
          problem     TEXT NOT NULL,
          difficulty  TEXT,
          status      TEXT NOT NULL,
          tests       INTEGER DEFAULT 0,
          failures    INTEGER DEFAULT 0,
          ran_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
          PRIMARY KEY (file, ran_at)
        );
      SQL
    end

    # Fill in every problem file so the full list is visible from day one.
    def self.seed(db)
      dirs = Dir.glob(File.join(ROOT, "[0-2][0-9]_*/")).sort
      files = dirs.flat_map { |d| Dir.glob(File.join(d, "*.rb")).sort }
      known = db.execute("SELECT file FROM problems").map(&:first).to_set

      files.each do |abs|
        rel = abs.sub("#{ROOT}/", "")
        next if known.include?(rel)

        db.execute(
          "INSERT INTO problems (file, pattern, problem, difficulty) VALUES (?, ?, ?, ?)",
          [
            rel,
            File.dirname(rel),
            File.basename(rel, ".rb"),
            read_difficulty(abs)
          ]
        )
      end
    end

    # -- Recording -----------------------------------------------------------

    def self.record(
      db,
      file:,
      pattern:,
      problem:,
      difficulty:,
      status:,
      tests:,
      failures:
    )
      return unless db

      now = Time.now.strftime("%Y-%m-%d %H:%M")

      # Append to run history
      db.execute(
        "INSERT INTO runs VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [
          file,
          pattern,
          problem,
          difficulty,
          status == "pass" ? "pass" : "fail",
          tests,
          failures,
          now
        ]
      )

      # Update current state — COALESCE keeps the trophy once earned
      db.execute(
        <<~SQL,
        UPDATE problems
        SET    status = ?, last_run = ?, tests = ?, failures = ?,
               first_pass = COALESCE(first_pass, ?)
        WHERE  file = ?
      SQL
        [status, now, tests, failures, (status == "pass" ? now : nil), file]
      )
    end

    # -- Helpers -------------------------------------------------------------

    def self.read_difficulty(path)
      File.foreach(path) { |l| return $1.strip if l =~ /# Difficulty:\s*(.+)/ }
      nil
    end
  end
end
