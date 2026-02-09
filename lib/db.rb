# frozen_string_literal: true

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
    def self.open
      return nil unless HAS_SQLITE

      db = SQLite3::Database.new(DB_PATH)
      db.execute <<~SQL
        CREATE TABLE IF NOT EXISTS solves (
          file        TEXT NOT NULL,
          pattern     TEXT NOT NULL,
          problem     TEXT NOT NULL,
          difficulty  TEXT,
          status      TEXT NOT NULL,
          tests       INTEGER DEFAULT 0,
          failures    INTEGER DEFAULT 0,
          solved_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
          PRIMARY KEY (file, solved_at)
        )
      SQL
      db.execute <<~SQL
        CREATE TABLE IF NOT EXISTS first_solve (
          file        TEXT PRIMARY KEY,
          pattern     TEXT NOT NULL,
          problem     TEXT NOT NULL,
          difficulty  TEXT,
          first_pass  DATETIME,
          last_run    DATETIME
        )
      SQL
      db
    end

    def self.record(
      db,
      file:,
      pattern:,
      problem:,
      difficulty:,
      passed:,
      tests:,
      failures:
    )
      return unless db

      status = passed ? "pass" : "fail"
      now = Time.now.strftime("%Y-%m-%d %H:%M:%S")

      db.execute(
        "INSERT INTO solves (file, pattern, problem, difficulty, status, tests, failures, solved_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [file, pattern, problem, difficulty, status, tests, failures, now]
      )

      existing =
        db.get_first_row(
          "SELECT first_pass FROM first_solve WHERE file = ?",
          [file]
        )
      if existing.nil?
        first_pass = passed ? now : nil
        db.execute(
          "INSERT INTO first_solve (file, pattern, problem, difficulty, first_pass, last_run) VALUES (?, ?, ?, ?, ?, ?)",
          [file, pattern, problem, difficulty, first_pass, now]
        )
      elsif passed && existing[0].nil?
        db.execute(
          "UPDATE first_solve SET first_pass = ?, last_run = ? WHERE file = ?",
          [now, now, file]
        )
      else
        db.execute(
          "UPDATE first_solve SET last_run = ? WHERE file = ?",
          [now, file]
        )
      end
    end
  end
end
