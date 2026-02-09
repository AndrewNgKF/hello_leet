# frozen_string_literal: true

module HelloLeet
  module Commands
    def self.stats(db)
      unless db
        puts HelloLeet.c(:yellow, "Install sqlite3 gem for stats: gem install sqlite3")
        exit 1
      end

      puts ""
      puts HelloLeet.c(:bold, "📊 Stats")
      puts ""

      # By difficulty
      rows = db.execute(<<~SQL)
        SELECT difficulty,
               COUNT(*) as total,
               SUM(CASE WHEN first_pass IS NOT NULL THEN 1 ELSE 0 END) as solved
        FROM first_solve
        GROUP BY difficulty ORDER BY
          CASE difficulty WHEN 'Easy' THEN 1 WHEN 'Medium' THEN 2 WHEN 'Hard' THEN 3 END
      SQL

      puts HelloLeet.c(:bold, "  By Difficulty:")
      rows.each do |diff, total, solved|
        bar_len = 20
        filled  = total > 0 ? (solved.to_f / total * bar_len).round : 0
        bar     = HelloLeet.c(:green, "█" * filled) + HelloLeet.c(:dim, "░" * (bar_len - filled))
        puts "    %-8s %s %d/%d" % [diff, bar, solved, total]
      end

      # By pattern
      puts ""
      puts HelloLeet.c(:bold, "  By Pattern:")
      rows = db.execute(<<~SQL)
        SELECT pattern,
               COUNT(*) as total,
               SUM(CASE WHEN first_pass IS NOT NULL THEN 1 ELSE 0 END) as solved
        FROM first_solve
        GROUP BY pattern ORDER BY pattern
      SQL

      rows.each do |pattern, total, solved|
        bar_len = 10
        filled  = total > 0 ? (solved.to_f / total * bar_len).round : 0
        bar     = HelloLeet.c(:green, "█" * filled) + HelloLeet.c(:dim, "░" * (bar_len - filled))
        status  = solved == total ? HelloLeet.c(:green, "✓") : " "
        puts "    #{status} %-25s %s %d/%d" % [pattern, bar, solved, total]
      end
      puts ""
    end
  end
end
