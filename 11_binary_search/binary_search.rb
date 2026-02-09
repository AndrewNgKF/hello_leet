# frozen_string_literal: true

# ============================================================================
# Problem: Binary Search (LeetCode #704)
# Link:    https://leetcode.com/problems/binary-search/
# Difficulty: Easy
# Pattern: Modified Binary Search
# ============================================================================
#
# Given an array of integers `nums` which is sorted in ascending order,
# and an integer `target`, write a function to search `target` in `nums`.
# If `target` exists, return its index. Otherwise, return -1.
#
# You must write an algorithm with O(log n) runtime complexity.
#
# Example 1:
#   Input:  nums = [-1, 0, 3, 5, 9, 12], target = 9
#   Output: 4
#
# Example 2:
#   Input:  nums = [-1, 0, 3, 5, 9, 12], target = 2
#   Output: -1
#
# Constraints:
#   - 1 <= nums.length <= 10^4
#   - All integers in nums are unique
#   - nums is sorted in ascending order
#
# Hints:
#   - Classic binary search. Initialize left = 0, right = length - 1.
#   - Compare the middle element to the target.
#   - Narrow the search space by half each iteration.
#
# ============================================================================

def binary_search(nums, target)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestBinarySearch < Minitest::Test
  def test_found
    assert_equal 4, binary_search([-1, 0, 3, 5, 9, 12], 9)
  end

  def test_not_found
    assert_equal(-1, binary_search([-1, 0, 3, 5, 9, 12], 2))
  end

  def test_first_element
    assert_equal 0, binary_search([1, 3, 5, 7], 1)
  end

  def test_last_element
    assert_equal 3, binary_search([1, 3, 5, 7], 7)
  end

  def test_single_element_found
    assert_equal 0, binary_search([5], 5)
  end

  def test_single_element_not_found
    assert_equal(-1, binary_search([5], 3))
  end
end
