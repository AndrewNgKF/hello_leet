# frozen_string_literal: true

# ============================================================================
# Progress Tracker
# ============================================================================
#
# Usage:
#   ruby progress.rb                  # Run all tests + track solve times
#   ruby progress.rb 01_two_pointers  # Run one pattern
#   ruby progress.rb 01 02 03         # Run multiple patterns (prefix match)
#   ruby progress.rb --log            # Show your solve history
#   ruby progress.rb --stats          # Show stats by difficulty/pattern
#   ruby progress.rb --dashboard      # Open visual progress dashboard in browser
#
# Solve history is saved to progress.db (SQLite). Install the gem for
# tracking: gem install sqlite3 (optional — everything works without it)
#
# ============================================================================

require_relative "lib/colors"
require_relative "lib/db"
require_relative "lib/log"
require_relative "lib/stats"
require_relative "lib/runner"
require_relative "lib/dashboard"

db = HelloLeet::DB.open

case ARGV.first
when "--log"
  HelloLeet::Commands.log(db)
when "--stats"
  HelloLeet::Commands.stats(db)
when "--dashboard"
  HelloLeet::Commands.dashboard(db)
else
  filters = ARGV.reject { |a| a.start_with?("--") }
  HelloLeet::Runner.new(filters, db).run
end
