# frozen_string_literal: true

module HelloLeet
  module Commands
    def self.log(db)
      unless db
        puts HelloLeet.c(
               :yellow,
               "Install sqlite3 gem for solve tracking: gem install sqlite3"
             )
        exit 1
      end

      rows = db.execute(<<~SQL)
        SELECT pattern, problem, difficulty, first_pass, last_run, status, tests, failures
        FROM problems ORDER BY pattern, problem
      SQL

      if rows.empty?
        puts HelloLeet.c(
               :yellow,
               "No history yet. Run `ruby progress.rb` to start tracking!"
             )
        return
      end

      solved = rows.count { |r| r[5] == "pass" }
      total = rows.length

      puts ""
      puts HelloLeet.c(:bold, "📋 Solve History — #{solved}/#{total} solved")
      puts ""
      puts HelloLeet.c(
             :dim,
             "  %-28s %-22s %-8s %-7s %-20s %s" %
               [
                 "Problem",
                 "Pattern",
                 "Diff",
                 "Tests",
                 "First Solved",
                 "Last Run"
               ]
           )
      puts HelloLeet.c(:dim, "  #{"─" * 100}")

      rows.each do |pattern, problem, diff, first_pass, last_run, status, tests, failures|
        icon =
          status == "pass" ? HelloLeet.c(:green, "✅") : HelloLeet.c(:dim, "⬜")
        diff_c =
          case diff
          when "Easy"
            HelloLeet.c(:green, "Easy  ")
          when "Medium"
            HelloLeet.c(:yellow, "Medium")
          when "Hard"
            HelloLeet.c(:red, "Hard  ")
          else
            "      "
          end
        test_str =
          tests && tests > 0 ? "#{tests - (failures || 0)}/#{tests}" : "—"
        first_str = first_pass ? "🏆 #{first_pass}" : HelloLeet.c(:dim, "—")
        last_str = last_run || HelloLeet.c(:dim, "—")
        puts "  #{icon} %-26s %-22s %s  %-7s %-20s %s" %
               [problem, pattern, diff_c, test_str, first_str, last_str]
      end
      puts ""
    end
  end
end
