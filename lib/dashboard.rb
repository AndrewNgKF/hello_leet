# frozen_string_literal: true

require "rbconfig"

module HelloLeet
  module Commands
    DASHBOARD_PATH =
      File.join(File.expand_path("../..", __dir__), "dashboard.html")

    def self.dashboard(db)
      unless db
        puts HelloLeet.c(
               :yellow,
               "Install sqlite3 gem for the dashboard: gem install sqlite3"
             )
        exit 1
      end

      data = DashboardData.new(db)
      if data.problems.empty?
        puts HelloLeet.c(
               :yellow,
               "No data yet. Run `ruby progress.rb` first to track your progress!"
             )
        exit 1
      end

      File.write(DASHBOARD_PATH, DashboardHTML.render(data))
      puts HelloLeet.c(:green, "Dashboard generated → dashboard.html")
      puts HelloLeet.c(:dim, "Opening in browser...")
      open_in_browser(DASHBOARD_PATH)
    end

    def self.open_in_browser(path)
      case RbConfig::CONFIG["host_os"]
      when /darwin/
        system("open", path)
      when /linux/
        system("xdg-open", path)
      when /mswin|mingw/
        system("start", path)
      end
    end
  end

  # --------------------------------------------------------------------------
  # Query layer — pulls everything we need in one shot
  # --------------------------------------------------------------------------
  class DashboardData
    attr_reader :problems,
                :recent,
                :timeline,
                :total,
                :solved,
                :easy,
                :medium,
                :hard,
                :pattern_data

    def initialize(db)
      @problems = db.execute(<<~SQL)
        SELECT file, pattern, problem, difficulty, first_pass, last_run
        FROM first_solve ORDER BY pattern, problem
      SQL

      @recent = db.execute(<<~SQL)
        SELECT problem, pattern, difficulty, status, solved_at
        FROM solves ORDER BY solved_at DESC LIMIT 20
      SQL

      @timeline = db.execute(<<~SQL)
        SELECT DATE(first_pass) as day, COUNT(*) as cnt
        FROM first_solve WHERE first_pass IS NOT NULL
        GROUP BY DATE(first_pass) ORDER BY day
      SQL

      @total = @problems.length
      @solved = @problems.count { |r| r[4] }

      %w[Easy Medium Hard].each do |d|
        subset = @problems.select { |r| r[3] == d }
        instance_variable_set(
          :"@#{d.downcase}",
          { all: subset.length, done: subset.count { |r| r[4] } }
        )
      end

      @pattern_data =
        @problems
          .group_by { |r| r[1] }
          .map do |pat, probs|
            { name: pat, total: probs.length, done: probs.count { |r| r[4] } }
          end
    end
  end

  # --------------------------------------------------------------------------
  # Pure-HTML renderer — zero external deps
  # --------------------------------------------------------------------------
  module DashboardHTML
    extend self

    def render(d)
      <<~HTML
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Hello LeetCode — Dashboard</title>
          <style>#{css}</style>
        </head>
        <body>
          <div class="header">
            <h1>🧩 Hello LeetCode</h1>
            <div class="subtitle">Your progress dashboard</div>
          </div>

          <div class="ring-container">
            #{ring("overall", d.solved, d.total, "Overall")}
            #{ring("easy", d.easy[:done], d.easy[:all], "Easy")}
            #{ring("medium", d.medium[:done], d.medium[:all], "Medium")}
            #{ring("hard", d.hard[:done], d.hard[:all], "Hard")}
          </div>

          <div class="stats-row">
            #{stat_card(d.solved, "Solved")}
            #{stat_card(d.total - d.solved, "Remaining")}
            #{stat_card(d.pattern_data.count { |p| p[:done] > 0 }, "Patterns Started")}
            #{stat_card(d.pattern_data.count { |p| p[:done] == p[:total] }, "Patterns Complete")}
          </div>

          <h2>📊 Patterns</h2>
          <div class="patterns-grid">#{pattern_cards(d.pattern_data)}</div>

          <h2>📋 Problems</h2>
          <div class="tabs">
            <div class="tab active" onclick="switchTab('all')">All Problems</div>
            <div class="tab" onclick="switchTab('recent')">Recent Activity</div>
          </div>

          <div id="tab-all" class="tab-content active">
            <table>
              <thead><tr><th></th><th>Problem</th><th>Pattern</th><th>Diff</th><th>First Solved</th><th>Last Run</th></tr></thead>
              <tbody>#{problem_rows(d.problems)}</tbody>
            </table>
          </div>

          <div id="tab-recent" class="tab-content">
            <table>
              <thead><tr><th></th><th>Problem</th><th>Diff</th><th>Timestamp</th></tr></thead>
              <tbody>#{recent_rows(d.recent)}</tbody>
            </table>
          </div>

          <div class="timestamp">Generated #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}</div>

          <script>
            function switchTab(id) {
              document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
              document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
              document.getElementById('tab-' + id).classList.add('active');
              event.target.classList.add('active');
            }
          </script>
        </body>
        </html>
      HTML
    end

    private

    # ---- Components --------------------------------------------------------

    def ring(cls, done, total, label)
      r = 54
      circ = 2 * Math::PI * r
      offset = circ * (1 - (total > 0 ? done.to_f / total : 0))
      <<~SVG
        <div class="ring #{cls}">
          <svg viewBox="0 0 120 120">
            <circle class="bg" cx="60" cy="60" r="#{r}" />
            <circle class="fg" cx="60" cy="60" r="#{r}"
              stroke-dasharray="#{circ}" stroke-dashoffset="#{offset}"
              transform="rotate(-90 60 60)" />
            <text class="ring-value" x="60" y="65" text-anchor="middle">#{done}/#{total}</text>
          </svg>
          <div class="ring-label">#{label}</div>
        </div>
      SVG
    end

    def stat_card(num, label) =
      %(<div class="stat-card"><div class="num">#{num}</div><div class="label">#{label}</div></div>)

    def pattern_cards(data)
      data
        .map do |p|
          pct = p[:total] > 0 ? (p[:done].to_f / p[:total] * 100).round : 0
          status =
            p[:done] == p[:total] ?
              "complete" :
              p[:done] > 0 ? "in-progress" : "not-started"
          <<~CARD
          <div class="pattern-card #{status}">
            <div class="pattern-name">#{p[:name]}</div>
            <div class="pattern-bar"><div class="pattern-fill" style="width: #{pct}%"></div></div>
            <div class="pattern-count">#{p[:done]}/#{p[:total]}</div>
          </div>
        CARD
        end
        .join
    end

    def diff_badge(diff)
      cls = (diff || "unknown").downcase
      %(<span class="diff #{cls}">#{diff || "?"}</span>)
    end

    def problem_rows(problems)
      problems
        .map do |_, pattern, problem, diff, first_pass, last_run|
          cls = first_pass ? "solved" : "todo"
          icon = first_pass ? "✅" : "⬜"
          <<~ROW
          <tr class="#{cls}">
            <td>#{icon}</td>
            <td><code>#{problem}</code></td>
            <td>#{pattern}</td>
            <td>#{diff_badge(diff)}</td>
            <td>#{first_pass || "—"}</td>
            <td>#{last_run || "—"}</td>
          </tr>
        ROW
        end
        .join
    end

    def recent_rows(recent)
      recent
        .map do |problem, _, diff, status, ts|
          icon = status == "pass" ? "✅" : "❌"
          <<~ROW
          <tr>
            <td>#{icon}</td>
            <td><code>#{problem}</code></td>
            <td>#{diff_badge(diff)}</td>
            <td>#{ts}</td>
          </tr>
        ROW
        end
        .join
    end

    # ---- CSS ---------------------------------------------------------------

    def css
      <<~CSS
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
          background: #0d1117; color: #c9d1d9; line-height: 1.5;
          padding: 2rem; max-width: 1100px; margin: 0 auto;
        }
        h1 { color: #f0f6fc; font-size: 1.8rem; margin-bottom: 0.3rem; }
        h2 { color: #f0f6fc; font-size: 1.2rem; margin: 2rem 0 1rem; border-bottom: 1px solid #21262d; padding-bottom: 0.5rem; }
        .subtitle { color: #8b949e; margin-bottom: 2rem; }
        .header { text-align: center; margin-bottom: 2rem; }

        .ring-container { display: flex; justify-content: center; gap: 2rem; flex-wrap: wrap; margin: 1.5rem 0; }
        .ring { text-align: center; }
        .ring svg { width: 140px; height: 140px; }
        .ring-label { font-size: 0.85rem; color: #8b949e; margin-top: 0.3rem; }
        .ring-value { font-size: 1.5rem; font-weight: 700; fill: #f0f6fc; }
        .ring circle { fill: none; stroke-width: 8; }
        .ring .bg { stroke: #21262d; }
        .ring .fg { stroke-linecap: round; transition: stroke-dashoffset 1s ease; }
        .ring.overall .fg { stroke: #58a6ff; }
        .ring.easy .fg    { stroke: #3fb950; }
        .ring.medium .fg  { stroke: #d29922; }
        .ring.hard .fg    { stroke: #f85149; }

        .stats-row { display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; margin: 1.5rem 0; }
        .stat-card {
          background: #161b22; border: 1px solid #21262d; border-radius: 8px;
          padding: 1rem 1.5rem; text-align: center; min-width: 120px;
        }
        .stat-card .num { font-size: 1.8rem; font-weight: 700; color: #f0f6fc; }
        .stat-card .label { font-size: 0.8rem; color: #8b949e; }

        .patterns-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 0.75rem; }
        .pattern-card {
          background: #161b22; border: 1px solid #21262d; border-radius: 8px;
          padding: 0.75rem 1rem; display: flex; align-items: center; gap: 0.75rem;
          min-width: 0;
        }
        .pattern-card.complete    { border-color: #238636; }
        .pattern-card.in-progress { border-color: #d29922; }
        .pattern-name {
          flex: 1; font-size: 0.85rem; font-weight: 500;
          overflow: hidden; text-overflow: ellipsis; white-space: nowrap; min-width: 0;
        }
        .pattern-bar { flex: 0 0 60px; height: 6px; background: #21262d; border-radius: 3px; overflow: hidden; }
        .pattern-fill { height: 100%; background: #3fb950; border-radius: 3px; transition: width 0.5s; }
        .pattern-count { flex-shrink: 0; font-size: 0.8rem; color: #8b949e; min-width: 36px; text-align: right; }

        table { width: 100%; border-collapse: collapse; font-size: 0.85rem; }
        th { text-align: left; color: #8b949e; font-weight: 500; padding: 0.5rem 0.75rem; border-bottom: 1px solid #21262d; }
        td { padding: 0.5rem 0.75rem; border-bottom: 1px solid #161b22; }
        tr.solved { background: #0d1117; }
        tr.todo   { opacity: 0.65; }
        code { background: #1c2128; padding: 0.15rem 0.4rem; border-radius: 4px; font-size: 0.82rem; }

        .diff {
          font-size: 0.75rem; font-weight: 600; padding: 0.15rem 0.5rem;
          border-radius: 10px; text-transform: uppercase; white-space: nowrap;
        }
        .diff.easy   { background: #0d2818; color: #3fb950; }
        .diff.medium { background: #2d1b00; color: #d29922; }
        .diff.hard   { background: #2d0a0a; color: #f85149; }

        .tabs { display: flex; gap: 0; margin-bottom: 1rem; }
        .tab {
          padding: 0.5rem 1.2rem; cursor: pointer; border: 1px solid #21262d;
          background: #0d1117; color: #8b949e; font-size: 0.85rem;
        }
        .tab:first-child { border-radius: 6px 0 0 6px; }
        .tab:last-child  { border-radius: 0 6px 6px 0; }
        .tab.active { background: #161b22; color: #f0f6fc; border-color: #30363d; }
        .tab-content { display: none; }
        .tab-content.active { display: block; }

        .timestamp { color: #8b949e; font-size: 0.8rem; text-align: center; margin-top: 3rem; }

        @media (max-width: 600px) {
          body { padding: 1rem; }
          .ring svg { width: 100px; height: 100px; }
          .patterns-grid { grid-template-columns: 1fr; }
        }
      CSS
    end
  end
end
