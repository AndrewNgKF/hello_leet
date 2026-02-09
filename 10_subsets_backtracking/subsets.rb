# frozen_string_literal: true

# ============================================================================
# Problem: Subsets (LeetCode #78)
# Link:    https://leetcode.com/problems/subsets/
# Difficulty: Medium
# Pattern: Subsets & Backtracking
# ============================================================================
#
# Given an integer array `nums` of unique elements, return all possible
# subsets (the power set).
#
# The solution set must not contain duplicate subsets. Return the solution
# in any order.
#
# Example 1:
#   Input:  nums = [1, 2, 3]
#   Output: [[], [1], [2], [1,2], [3], [1,3], [2,3], [1,2,3]]
#
# Example 2:
#   Input:  nums = [0]
#   Output: [[], [0]]
#
# Constraints:
#   - 1 <= nums.length <= 10
#   - -10 <= nums[i] <= 10
#   - All elements are unique
#
# Hints:
#   - At each step, you have two choices: include the current element or not.
#   - Use backtracking: add current element, recurse, then remove it.
#   - Start index prevents revisiting earlier elements.
#
# ============================================================================

def subsets(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestSubsets < Minitest::Test
  def test_example_1
    result = subsets([1, 2, 3]).map(&:sort).sort
    expected = [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]].map(
      &:sort
    ).sort
    assert_equal expected, result
  end

  def test_single_element
    result = subsets([0]).map(&:sort).sort
    expected = [[], [0]].sort
    assert_equal expected, result
  end

  def test_two_elements
    result = subsets([1, 2]).map(&:sort).sort
    expected = [[], [1], [2], [1, 2]].map(&:sort).sort
    assert_equal expected, result
  end

  def test_count
    # 2^n subsets for n elements
    assert_equal 16, subsets([1, 2, 3, 4]).length
  end
end
