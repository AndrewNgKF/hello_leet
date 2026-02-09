# frozen_string_literal: true

# ============================================================================
# Problem: Find Peak Element (LeetCode #162)
# Link:    https://leetcode.com/problems/find-peak-element/
# Difficulty: Medium
# Pattern: Modified Binary Search
# ============================================================================
#
# A peak element is an element that is strictly greater than its neighbors.
#
# Given a 0-indexed integer array `nums`, find a peak element, and return
# its index. If the array contains multiple peaks, return the index to any
# of the peaks.
#
# You may imagine that nums[-1] = nums[n] = -∞ (the boundaries are negative
# infinity).
#
# You must write an algorithm that runs in O(log n) time.
#
# Example 1:
#   Input:  nums = [1, 2, 3, 1]
#   Output: 2
#   Explanation: 3 is a peak element (index 2).
#
# Example 2:
#   Input:  nums = [1, 2, 1, 3, 5, 6, 4]
#   Output: 5 (or 1 — any peak is valid)
#   Explanation: Index 1 (value 2) and index 5 (value 6) are both peaks.
#
# Constraints:
#   - 1 <= nums.length <= 1000
#   - -2^31 <= nums[i] <= 2^31 - 1
#   - nums[i] != nums[i + 1] for all valid i
#
# Hints:
#   - If nums[mid] < nums[mid+1], the peak must be to the right.
#   - If nums[mid] < nums[mid-1], the peak must be to the left.
#   - This guarantees convergence because the boundaries are -∞.
#
# ============================================================================

def find_peak_element(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestFindPeakElement < Minitest::Test
  def test_example_1
    assert_equal 2, find_peak_element([1, 2, 3, 1])
  end

  def test_example_2
    result = find_peak_element([1, 2, 1, 3, 5, 6, 4])
    assert_includes [1, 5], result # either peak is valid
  end

  def test_single_element
    assert_equal 0, find_peak_element([1])
  end

  def test_two_elements_ascending
    assert_equal 1, find_peak_element([1, 2])
  end

  def test_two_elements_descending
    assert_equal 0, find_peak_element([2, 1])
  end

  def test_increasing_array
    assert_equal 4, find_peak_element([1, 2, 3, 4, 5])
  end
end
