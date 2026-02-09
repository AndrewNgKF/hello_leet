# frozen_string_literal: true

# ============================================================================
# Problem: Sliding Window Median (LeetCode #480)
# Link:    https://leetcode.com/problems/sliding-window-median/
# Difficulty: Hard
# Pattern: Two Heaps
# ============================================================================
#
# The median is the middle value in an ordered integer list.
#
# You are given an integer array `nums` and an integer `k`. There is a
# sliding window of size k which is moving from the very left to the very
# right. You can only see the k numbers in the window. Each time the
# window moves right by one position.
#
# Return the median array for each window position.
#
# Example:
#   Input:  nums = [1,3,-1,-3,5,3,6,7], k = 3
#   Output: [1.0, -1.0, -1.0, 3.0, 5.0, 6.0]
#   Window positions:
#     [1  3  -1] -3  5  3  6  7  → median = 1
#      1 [3  -1  -3] 5  3  6  7  → median = -1
#      ...
#
# Constraints:
#   - 1 <= k <= nums.length <= 10^5
#
# Hints:
#   - Extend the two heaps pattern with lazy deletion for the sliding window.
#   - Or simpler approach: use a sorted array and binary search insert/delete.
#   - Ruby-style: nums.each_cons(k).map { |w| w.sort.then { |s| ... } }
#     (works but O(n*k*log k) rather than optimal O(n log k)).
#
# ============================================================================

def median_sliding_window(nums, k)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestSlidingWindowMedian < Minitest::Test
  def test_example
    result = median_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 3)
    expected = [1.0, -1.0, -1.0, 3.0, 5.0, 6.0]
    expected
      .zip(result || [])
      .each_with_index do |(exp, act), i|
        assert_in_delta exp, act.to_f, 0.001, "Window #{i}"
      end
  end

  def test_k_1
    assert_equal [1.0, 2.0, 3.0],
                 median_sliding_window([1, 2, 3], 1)&.map(&:to_f)
  end

  def test_k_equals_length
    result = median_sliding_window([1, 2, 3, 4], 4)
    assert_in_delta 2.5, (result || [0]).first.to_f, 0.001
  end

  def test_even_window
    result = median_sliding_window([1, 3, 5, 7], 2)
    expected = [2.0, 4.0, 6.0]
    expected.zip(result || []).each { |e, a| assert_in_delta e, a.to_f, 0.001 }
  end
end
