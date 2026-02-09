# frozen_string_literal: true

# ============================================================================
# Problem: Missing Number (LeetCode #268)
# Link:    https://leetcode.com/problems/missing-number/
# Difficulty: Easy
# Pattern: Cyclic Sort
# ============================================================================
#
# Given an array `nums` containing n distinct numbers in the range [0, n],
# return the only number in the range that is missing from the array.
#
# Example 1:
#   Input:  nums = [3, 0, 1]
#   Output: 2
#
# Example 2:
#   Input:  nums = [0, 1]
#   Output: 2
#
# Example 3:
#   Input:  nums = [9,6,4,2,3,5,7,0,1]
#   Output: 8
#
# Constraints:
#   - n == nums.length
#   - 0 <= nums[i] <= n
#   - All numbers are unique
#
# Hints:
#   - Cyclic sort: put each number at its correct index (nums[i] at index i).
#     The index where the number doesn't match is the answer.
#   - Alternative: sum formula n*(n+1)/2 - nums.sum
#   - Alternative: XOR all indices and values.
#   - Ruby-style: ((0..nums.length).to_a - nums).first
#
# ============================================================================

def missing_number(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMissingNumber < Minitest::Test
  def test_example_1
    assert_equal 2, missing_number([3, 0, 1])
  end

  def test_example_2
    assert_equal 2, missing_number([0, 1])
  end

  def test_example_3
    assert_equal 8, missing_number([9, 6, 4, 2, 3, 5, 7, 0, 1])
  end

  def test_missing_zero
    assert_equal 0, missing_number([1])
  end

  def test_missing_n
    assert_equal 3, missing_number([0, 1, 2])
  end

  def test_single_zero
    assert_equal 1, missing_number([0])
  end
end
