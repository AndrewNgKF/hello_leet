# frozen_string_literal: true

# ============================================================================
# Problem: Top K Frequent Elements (LeetCode #347)
# Link:    https://leetcode.com/problems/top-k-frequent-elements/
# Difficulty: Medium
# Pattern: Top K Elements
# ============================================================================
#
# Given an integer array `nums` and an integer `k`, return the k most
# frequent elements. You may return the answer in any order.
#
# Example 1:
#   Input:  nums = [1,1,1,2,2,3], k = 2
#   Output: [1,2]
#
# Example 2:
#   Input:  nums = [1], k = 1
#   Output: [1]
#
# Constraints:
#   - 1 <= nums.length <= 10^5
#   - -10^4 <= nums[i] <= 10^4
#   - k is in range [1, number of unique elements]
#   - Answer is guaranteed to be unique
#
# Hints:
#   - Count frequencies, then get top k — use a min-heap of size k.
#   - Or bucket sort: index = frequency, bucket holds numbers with that freq.
#   - Ruby-style: nums.tally.sort_by { |_, v| -v }.first(k).map(&:first)
#     Even shorter: nums.tally.max_by(k) { |_, v| v }.map(&:first)
#
# ============================================================================

def top_k_frequent(nums, k)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestTopKFrequent < Minitest::Test
  def test_example_1
    assert_equal [1, 2], (top_k_frequent([1, 1, 1, 2, 2, 3], 2) || []).sort
  end

  def test_single
    assert_equal [1], top_k_frequent([1], 1)
  end

  def test_all_same_frequency
    result = (top_k_frequent([1, 2, 3], 2) || []).sort
    # Any 2 of [1,2,3] is valid; just check length
    assert_equal 2, result.length
  end

  def test_negative_numbers
    assert_equal [-1, 2], (top_k_frequent([-1, -1, 2, 2, 3], 2) || []).sort
  end
end
