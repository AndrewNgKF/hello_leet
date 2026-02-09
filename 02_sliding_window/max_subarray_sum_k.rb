# frozen_string_literal: true

# ============================================================================
# Problem: Maximum Sum Subarray of Size K
# Link:    (Classic sliding window problem - not on LeetCode as standalone)
# Difficulty: Easy
# Pattern: Sliding Window (Fixed Size)
# ============================================================================
#
# Given an array of positive numbers and a positive number k, find the
# maximum sum of any contiguous subarray of size k.
#
# Example 1:
#   Input:  nums = [2, 1, 5, 1, 3, 2], k = 3
#   Output: 9
#   Explanation: Subarray [5, 1, 3] has the maximum sum of 9.
#
# Example 2:
#   Input:  nums = [2, 3, 4, 1, 5], k = 2
#   Output: 7
#   Explanation: Subarray [3, 4] has the maximum sum of 7.
#
# Constraints:
#   - 1 <= k <= nums.length
#   - nums contains only positive numbers
#
# Hints:
#   - Compute the sum of the first window of size k.
#   - Slide the window: add the new element on the right, subtract the
#     element leaving on the left.
#   - Track the maximum sum seen.
#
# ============================================================================

def max_subarray_sum_k(nums, k)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMaxSubarraySumK < Minitest::Test
  def test_example_1
    assert_equal 9, max_subarray_sum_k([2, 1, 5, 1, 3, 2], 3)
  end

  def test_example_2
    assert_equal 7, max_subarray_sum_k([2, 3, 4, 1, 5], 2)
  end

  def test_entire_array
    assert_equal 10, max_subarray_sum_k([1, 2, 3, 4], 4)
  end

  def test_single_element_window
    assert_equal 5, max_subarray_sum_k([1, 5, 3, 2], 1)
  end

  def test_all_same
    assert_equal 9, max_subarray_sum_k([3, 3, 3, 3, 3], 3)
  end
end
