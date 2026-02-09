# frozen_string_literal: true

# ============================================================================
# Problem: Search in Rotated Sorted Array (LeetCode #33)
# Link:    https://leetcode.com/problems/search-in-rotated-sorted-array/
# Difficulty: Medium
# Pattern: Modified Binary Search
# ============================================================================
#
# There is an integer array `nums` sorted in ascending order (with distinct
# values). Prior to being passed to your function, `nums` is possibly rotated
# at an unknown pivot index k (1 <= k < nums.length) such that the resulting
# array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], ..., nums[k-1]].
#
# Given the rotated array `nums` and an integer `target`, return the index
# of `target` if it is in `nums`, or -1 if it is not.
#
# You must write an algorithm with O(log n) runtime complexity.
#
# Example 1:
#   Input:  nums = [4, 5, 6, 7, 0, 1, 2], target = 0
#   Output: 4
#
# Example 2:
#   Input:  nums = [4, 5, 6, 7, 0, 1, 2], target = 3
#   Output: -1
#
# Example 3:
#   Input:  nums = [1], target = 0
#   Output: -1
#
# Constraints:
#   - 1 <= nums.length <= 5000
#   - All values are unique
#   - nums was sorted, then possibly rotated
#
# Hints:
#   - At any midpoint, one half is always sorted.
#   - Determine which half is sorted, then check if target lies in that half.
#   - If yes, search that half. Otherwise, search the other half.
#
# ============================================================================

def search(nums, target)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestSearchRotatedArray < Minitest::Test
  def test_found_in_right
    assert_equal 4, search([4, 5, 6, 7, 0, 1, 2], 0)
  end

  def test_not_found
    assert_equal(-1, search([4, 5, 6, 7, 0, 1, 2], 3))
  end

  def test_single_element_not_found
    assert_equal(-1, search([1], 0))
  end

  def test_single_element_found
    assert_equal 0, search([1], 1)
  end

  def test_found_in_left
    assert_equal 1, search([4, 5, 6, 7, 0, 1, 2], 5)
  end

  def test_not_rotated
    assert_equal 2, search([1, 2, 3, 4, 5], 3)
  end

  def test_two_elements
    assert_equal 1, search([3, 1], 1)
  end
end
