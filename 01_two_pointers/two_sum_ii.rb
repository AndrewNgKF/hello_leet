# frozen_string_literal: true

# ============================================================================
# Problem: Two Sum II - Input Array Is Sorted (LeetCode #167)
# Link:    https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
# Difficulty: Easy
# Pattern: Two Pointers (Converging)
# ============================================================================
#
# Given a 1-indexed array of integers `numbers` that is already sorted in
# non-decreasing order, find two numbers such that they add up to a specific
# `target` number.
#
# Return the indices of the two numbers (1-indexed) as an array [index1, index2]
# where 1 <= index1 < index2 <= numbers.length.
#
# You may not use the same element twice. There is exactly one solution.
#
# Example 1:
#   Input:  numbers = [2, 7, 11, 15], target = 9
#   Output: [1, 2]
#   Explanation: 2 + 7 = 9, so index1 = 1, index2 = 2.
#
# Example 2:
#   Input:  numbers = [2, 3, 4], target = 6
#   Output: [1, 3]
#
# Example 3:
#   Input:  numbers = [-1, 0], target = -1
#   Output: [1, 2]
#
# Constraints:
#   - 2 <= numbers.length <= 3 * 10^4
#   - -1000 <= numbers[i] <= 1000
#   - numbers is sorted in non-decreasing order
#   - Exactly one solution exists
#
# Hints:
#   - Since the array is sorted, think about what happens when the sum of
#     two pointers is too large vs too small.
#   - Start with pointers at both ends. If sum > target, move right pointer
#     left. If sum < target, move left pointer right.
#
# ============================================================================

def two_sum(numbers, target)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestTwoSumII < Minitest::Test
  def test_example_1
    assert_equal [1, 2], two_sum([2, 7, 11, 15], 9)
  end

  def test_example_2
    assert_equal [1, 3], two_sum([2, 3, 4], 6)
  end

  def test_negative_numbers
    assert_equal [1, 2], two_sum([-1, 0], -1)
  end

  def test_larger_array
    assert_equal [2, 5], two_sum([1, 3, 4, 5, 7, 10], 10)
  end

  def test_same_values
    assert_equal [1, 2], two_sum([1, 1, 2, 3], 2)
  end
end
