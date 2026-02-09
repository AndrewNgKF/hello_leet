# frozen_string_literal: true

# ============================================================================
# Problem: Counting Bits (LeetCode #338)
# Link:    https://leetcode.com/problems/counting-bits/
# Difficulty: Easy
# Pattern: Bit Manipulation
# ============================================================================
#
# Given an integer n, return an array `ans` of length n + 1 such that for
# each i (0 <= i <= n), ans[i] is the number of 1's in the binary
# representation of i.
#
# Example 1:
#   Input:  n = 2
#   Output: [0, 1, 1]
#   Explanation: 0 → 0, 1 → 1, 2 → 10
#
# Example 2:
#   Input:  n = 5
#   Output: [0, 1, 1, 2, 1, 2]
#
# Constraints:
#   - 0 <= n <= 10^5
#
# Hints:
#   - DP + bit manipulation: ans[i] = ans[i >> 1] + (i & 1)
#     (number of bits in i = bits in i/2 + last bit)
#   - Or: ans[i] = ans[i & (i-1)] + 1 (drop lowest set bit)
#   - Ruby-style: (0..n).map { |i| i.digits(2).sum }
#     Or even: (0..n).map { |i| i.to_s(2).count("1") }
#
# ============================================================================

def count_bits(n)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestCountingBits < Minitest::Test
  def test_n_2
    assert_equal [0, 1, 1], count_bits(2)
  end

  def test_n_5
    assert_equal [0, 1, 1, 2, 1, 2], count_bits(5)
  end

  def test_n_0
    assert_equal [0], count_bits(0)
  end

  def test_n_1
    assert_equal [0, 1], count_bits(1)
  end

  def test_n_8
    assert_equal [0, 1, 1, 2, 1, 2, 2, 3, 1], count_bits(8)
  end
end
