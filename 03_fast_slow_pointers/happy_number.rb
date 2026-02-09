# frozen_string_literal: true

# ============================================================================
# Problem: Happy Number (LeetCode #202)
# Link:    https://leetcode.com/problems/happy-number/
# Difficulty: Easy
# Pattern: Fast & Slow Pointers
# ============================================================================
#
# Write an algorithm to determine if a number n is happy.
#
# A happy number is defined by the following process:
#   - Starting with any positive integer, replace the number by the sum
#     of the squares of its digits.
#   - Repeat the process until the number equals 1 (where it will stay),
#     or it loops endlessly in a cycle which does not include 1.
#   - A number is happy if this process ends in 1.
#
# Example 1:
#   Input:  n = 19
#   Output: true
#   Explanation: 1² + 9² = 82 → 8² + 2² = 68 → 6² + 8² = 100 → 1² + 0² + 0² = 1 ✓
#
# Example 2:
#   Input:  n = 2
#   Output: false
#
# Constraints:
#   - 1 <= n <= 2^31 - 1
#
# Hints:
#   - This is cycle detection! The sequence of digit-square-sums either
#     reaches 1 or enters a cycle.
#   - Fast & slow pointers: slow computes one step, fast computes two.
#   - Ruby-style: you could also use a Set to track seen numbers.
#   - Helper: sum of digit squares = n.digits.sum { |d| d * d }
#
# ============================================================================

def is_happy?(n)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestHappyNumber < Minitest::Test
  def test_19_is_happy
    assert is_happy?(19)
  end

  def test_1_is_happy
    assert is_happy?(1)
  end

  def test_2_is_not_happy
    refute is_happy?(2)
  end

  def test_7_is_happy
    assert is_happy?(7)
  end

  def test_116_is_not_happy
    refute is_happy?(116)
  end
end
