# frozen_string_literal: true

# ============================================================================
# Problem: Daily Temperatures (LeetCode #739)
# Link:    https://leetcode.com/problems/daily-temperatures/
# Difficulty: Medium
# Pattern: Monotonic Stack
# ============================================================================
#
# Given an array of integers `temperatures`, return an array `answer`
# where answer[i] is the number of days you have to wait after the ith
# day to get a warmer temperature. If there is no future warmer day,
# answer[i] == 0.
#
# Example 1:
#   Input:  temperatures = [73,74,75,71,69,72,76,73]
#   Output: [1,1,4,2,1,1,0,0]
#
# Example 2:
#   Input:  temperatures = [30,40,50,60]
#   Output: [1,1,1,0]
#
# Constraints:
#   - 1 <= temperatures.length <= 10^5
#   - 30 <= temperatures[i] <= 100
#
# Hints:
#   - Use a monotonic decreasing stack storing indices.
#   - For each temperature, pop all stack entries with smaller temperatures
#     and record the distance.
#
# ============================================================================

def daily_temperatures(temperatures)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestDailyTemperatures < Minitest::Test
  def test_example_1
    assert_equal [1, 1, 4, 2, 1, 1, 0, 0], daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73])
  end

  def test_increasing
    assert_equal [1, 1, 1, 0], daily_temperatures([30, 40, 50, 60])
  end

  def test_decreasing
    assert_equal [0, 0, 0], daily_temperatures([60, 50, 40])
  end

  def test_constant
    assert_equal [0, 0, 0], daily_temperatures([50, 50, 50])
  end

  def test_single
    assert_equal [0], daily_temperatures([50])
  end
end
