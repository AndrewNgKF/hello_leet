# frozen_string_literal: true

module HelloLeet
  module Commands
    def self.log(db)
      unless db
        puts HelloLeet.c(:yellow, "Install sqlite3 gem for solve tracking: gem install sqlite3")
        exit 1
      end

      rows = db.execute(<<~SQL)
        SELECT pattern, problem, difficulty, first_pass, last_run
        FROM first_solve ORDER BY pattern, problem
      SQL

      if rows.empty?
        puts HelloLeet.c(:yellow, "No history yet. Run `ruby progress.rb` to start tracking!")
        return
      end

      solved, total = rows.count { |r| r[3] }, rows.length

      puts ""
      puts HelloLeet.c(:bold, "📋 Solve History — #{solved}/#{total} solved")
      puts ""
      puts HelloLeet.c(:dim, "  %-25s %-10s %-8s %-20s %s" % %w[Problem Pattern Diff First\ Solved Last\ Run])
      puts HelloLeet.c(:dim, "  #{"─" * 90}")

      rows.each do |_pattern, problem, diff, first_pass, last_run|
        status = first_pass ? HelloLeet.c(:green, "✓") : HelloLeet.c(:red, "✗")
        diff_c = case diff
                 when "Easy"   then HelloLeet.c(:green,  "Easy  ")
                 when "Medium" then HelloLeet.c(:yellow, "Medium")
                 when "Hard"   then HelloLeet.c(:red,    "Hard  ")
                 else "      "
                 end
        first_str = first_pass || HelloLeet.c(:dim, "—")
        last_str  = last_run   || HelloLeet.c(:dim, "—")
        puts "  #{status} %-23s %-10s %s  %-20s %s" % [problem, _pattern[0..8], diff_c, first_str, last_str]
      end
      puts ""
    end
  end
end
