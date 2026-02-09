# frozen_string_literal: true

# ============================================================================
# Problem: Kth Largest Element in an Array (LeetCode #215)
# Link:    https://leetcode.com/problems/kth-largest-element-in-an-array/
# Difficulty: Medium
# Pattern: Top K Elements
# ============================================================================
#
# Given an integer array `nums` and an integer `k`, return the kth largest
# element in the array.
#
# Note that it is the kth largest element in sorted order, not the kth
# distinct element.
#
# Example 1:
#   Input:  nums = [3,2,1,5,6,4], k = 2
#   Output: 5
#
# Example 2:
#   Input:  nums = [3,2,3,1,2,4,5,5,6], k = 4
#   Output: 4
#
# Constraints:
#   - 1 <= k <= nums.length <= 10^5
#
# Hints:
#   - Use a min-heap of size k. The top of the heap is the kth largest.
#   - Or use Quickselect (partition-based, O(n) average).
#   - Ruby-style: nums.sort[-k] or nums.max(k).last
#
# ============================================================================

def find_kth_largest(nums, k)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestKthLargest < Minitest::Test
  def test_example_1
    assert_equal 5, find_kth_largest([3, 2, 1, 5, 6, 4], 2)
  end

  def test_example_2
    assert_equal 4, find_kth_largest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
  end

  def test_k_1
    assert_equal 6, find_kth_largest([3, 2, 1, 5, 6, 4], 1)
  end

  def test_k_equals_length
    assert_equal 1, find_kth_largest([3, 2, 1, 5, 6, 4], 6)
  end

  def test_single
    assert_equal 1, find_kth_largest([1], 1)
  end
end
