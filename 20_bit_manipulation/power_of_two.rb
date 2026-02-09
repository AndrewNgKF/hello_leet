# frozen_string_literal: true

# ============================================================================
# Problem: Power of Two (LeetCode #231)
# Link:    https://leetcode.com/problems/power-of-two/
# Difficulty: Easy
# Pattern: Bit Manipulation
# ============================================================================
#
# Given an integer n, return true if it is a power of two. Otherwise,
# return false. A power of two is 2^x where x is a non-negative integer.
#
# Example 1:
#   Input:  n = 1
#   Output: true   (2^0 = 1)
#
# Example 2:
#   Input:  n = 16
#   Output: true   (2^4 = 16)
#
# Example 3:
#   Input:  n = 3
#   Output: false
#
# Constraints:
#   - -2^31 <= n <= 2^31 - 1
#
# Hints:
#   - A power of two in binary has exactly one '1' bit: 1, 10, 100, 1000...
#   - Trick: n & (n - 1) removes the lowest set bit. If the result is 0
#     and n > 0, it's a power of two!
#   - Ruby-style: n > 0 && n.to_s(2).count("1") == 1
#     Or: n > 0 && (n & (n - 1)).zero?
#
# ============================================================================

def is_power_of_two(n)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestPowerOfTwo < Minitest::Test
  def test_1
    assert is_power_of_two(1)
  end

  def test_16
    assert is_power_of_two(16)
  end

  def test_3
    refute is_power_of_two(3)
  end

  def test_0
    refute is_power_of_two(0)
  end

  def test_negative
    refute is_power_of_two(-16)
  end

  def test_large_power
    assert is_power_of_two(1024)
  end

  def test_not_power
    refute is_power_of_two(6)
  end
end
