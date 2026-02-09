# frozen_string_literal: true

# ============================================================================
# Problem: 3Sum (LeetCode #15)
# Link:    https://leetcode.com/problems/3sum/
# Difficulty: Medium
# Pattern: Two Pointers (Three Pointers)
# ============================================================================
#
# Given an integer array `nums`, return all the triplets
# [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k,
# and nums[i] + nums[j] + nums[k] == 0.
#
# The solution set must not contain duplicate triplets.
#
# Example 1:
#   Input:  nums = [-1, 0, 1, 2, -1, -4]
#   Output: [[-1, -1, 2], [-1, 0, 1]]
#
# Example 2:
#   Input:  nums = [0, 1, 1]
#   Output: []
#
# Example 3:
#   Input:  nums = [0, 0, 0]
#   Output: [[0, 0, 0]]
#
# Constraints:
#   - 3 <= nums.length <= 3000
#   - -10^5 <= nums[i] <= 10^5
#
# Hints:
#   - Sort the array first.
#   - For each element, use two pointers on the remaining portion to find
#     pairs that sum to the negation of the current element.
#   - Skip duplicates at every level to avoid duplicate triplets.
#
# ============================================================================

def three_sum(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestThreeSum < Minitest::Test
  def test_example_1
    result = three_sum([-1, 0, 1, 2, -1, -4])
    assert_equal [[-1, -1, 2], [-1, 0, 1]], result.map(&:sort).sort
  end

  def test_no_solution
    assert_equal [], three_sum([0, 1, 1])
  end

  def test_all_zeros
    assert_equal [[0, 0, 0]], three_sum([0, 0, 0])
  end

  def test_multiple_solutions
    result = three_sum([-2, 0, 1, 1, 2])
    assert_equal [[-2, 0, 2], [-2, 1, 1]], result.map(&:sort).sort
  end

  def test_empty_result_all_positive
    assert_equal [], three_sum([1, 2, 3, 4, 5])
  end
end
