# frozen_string_literal: true

# ============================================================================
# Problem: Single Number (LeetCode #136)
# Link:    https://leetcode.com/problems/single-number/
# Difficulty: Easy
# Pattern: Bit Manipulation
# ============================================================================
#
# Given a non-empty array of integers `nums`, every element appears twice
# except for one. Find that single one.
#
# You must implement a solution with O(n) time and O(1) extra space.
#
# Example 1:
#   Input:  nums = [2, 2, 1]
#   Output: 1
#
# Example 2:
#   Input:  nums = [4, 1, 2, 1, 2]
#   Output: 4
#
# Constraints:
#   - 1 <= nums.length <= 3 * 10^4
#   - Each element appears exactly twice except one
#
# Hints:
#   - XOR all numbers together! a ^ a = 0, a ^ 0 = a.
#   - Ruby-style: nums.reduce(:^)
#
# ============================================================================

def single_number(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestSingleNumber < Minitest::Test
  def test_example_1
    assert_equal 1, single_number([2, 2, 1])
  end

  def test_example_2
    assert_equal 4, single_number([4, 1, 2, 1, 2])
  end

  def test_single_element
    assert_equal 99, single_number([99])
  end

  def test_negative
    assert_equal(-1, single_number([-1, 3, 3]))
  end

  def test_large
    nums = (1..1000).to_a * 2 + [42_042]
    assert_equal 42_042, single_number(nums.shuffle)
  end
end
