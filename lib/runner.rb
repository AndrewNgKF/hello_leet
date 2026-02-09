# frozen_string_literal: true

module HelloLeet
  class Runner
    ROOT = File.expand_path("..", __dir__)

    def initialize(filters, db)
      @filters = filters
      @db = db
      @total_files = @passed_files = @failed_files = 0
      @total_tests = @total_assertions = @total_failures = @total_errors = 0
    end

    def run
      files = find_files
      abort HelloLeet.c(:yellow, "No test files found.") if files.empty?

      puts ""
      puts HelloLeet.c(:bold, "🧩 Hello LeetCode — Progress")
      tracking =
        (
          if HAS_SQLITE
            HelloLeet.c(:green, "tracking ON")
          else
            HelloLeet.c(:dim, "tracking OFF (gem install sqlite3)")
          end
        )
      puts "   Running #{files.length} files... #{tracking}\n\n"

      files.each { |f| run_file(f) }
      print_summary
      exit(@total_failures + @total_errors > 0 ? 1 : 0)
    end

    private

    def find_files
      dirs = Dir.glob(File.join(ROOT, "[0-2][0-9]_*/")).sort
      if @filters.any?
        dirs.select! do |d|
          @filters.any? do |f|
            File.basename(d).start_with?(f) || File.basename(d).include?(f)
          end
        end
      end
      dirs.flat_map { |d| Dir.glob(File.join(d, "*.rb")).sort }
    end

    def extract_difficulty(file)
      File.foreach(file) { |l| return $1.strip if l =~ /# Difficulty:\s*(.+)/ }
      nil
    end

    def run_file(file)
      @total_files += 1
      rel = file.sub("#{ROOT}/", "")
      pattern = File.dirname(rel)
      problem = File.basename(rel, ".rb")
      difficulty = extract_difficulty(file)

      output = `ruby "#{file}" 2>&1`
      success = $?.success?

      runs = failures = errors = assertions = 0
      if output =~ /(\d+) runs, (\d+) assertions, (\d+) failures, (\d+) errors/
        runs, assertions, failures, errors = $1.to_i, $2.to_i, $3.to_i, $4.to_i
        @total_tests += runs
        @total_assertions += assertions
        @total_failures += failures
        @total_errors += errors
      end

      DB.record(
        @db,
        file: rel,
        pattern: pattern,
        problem: problem,
        difficulty: difficulty,
        passed: success,
        tests: runs,
        failures: failures + errors
      )

      if success
        @passed_files += 1
        puts "  #{HelloLeet.c(:green, "✓")} #{rel}"
      else
        @failed_files += 1
        fail_count =
          output.lines.count do |l|
            l.include?("Failure:") || l.include?("Error:")
          end
        puts "  #{HelloLeet.c(:red, "✗")} #{rel}  #{HelloLeet.c(:red, "(#{fail_count} failures)")}"
      end
    end

    def print_summary
      puts ""
      puts HelloLeet.c(:bold, "=" * 55)
      puts "#{HelloLeet.c(:bold, "  Files:")}      #{@total_files} total"
      puts "#{HelloLeet.c(:green, "  Solved:")}     #{@passed_files} (all tests passing)"
      puts "#{HelloLeet.c(:yellow, "  TODO:")}       #{@failed_files} (have failing tests)"
      puts ""
      puts "#{HelloLeet.c(:bold, "  Tests:")}      #{@total_tests} runs, #{@total_assertions} assertions"
      status_color = (@total_failures + @total_errors > 0) ? :red : :green
      puts "#{HelloLeet.c(status_color, "  Results:")}    #{@total_failures} failures, #{@total_errors} errors"
      puts HelloLeet.c(:bold, "=" * 55)
      puts ""

      if @failed_files > 0
        puts "  #{HelloLeet.c(:cyan, "#{@failed_files} problems waiting for you! 💪")}"
      else
        puts "  #{HelloLeet.c(:green, "🎉 All problems solved! You're a legend.")}"
      end

      if HAS_SQLITE
        puts ""
        puts "  #{HelloLeet.c(:dim, "History saved → progress.db")}"
        puts "  #{HelloLeet.c(:dim, "View: ruby progress.rb --log  |  --stats  |  --dashboard")}"
      end
      puts ""
    end
  end
end
