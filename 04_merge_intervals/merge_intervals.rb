# frozen_string_literal: true

# ============================================================================
# Problem: Merge Intervals (LeetCode #56)
# Link:    https://leetcode.com/problems/merge-intervals/
# Difficulty: Medium
# Pattern: Merge Intervals
# ============================================================================
#
# Given an array of intervals where intervals[i] = [start_i, end_i],
# merge all overlapping intervals and return an array of the non-overlapping
# intervals that cover all the intervals in the input.
#
# Example 1:
#   Input:  intervals = [[1,3],[2,6],[8,10],[15,18]]
#   Output: [[1,6],[8,10],[15,18]]
#   Explanation: [1,3] and [2,6] overlap, merged to [1,6].
#
# Example 2:
#   Input:  intervals = [[1,4],[4,5]]
#   Output: [[1,5]]
#   Explanation: [1,4] and [4,5] are considered overlapping (touching).
#
# Constraints:
#   - 1 <= intervals.length <= 10^4
#   - intervals[i].length == 2
#   - 0 <= start_i <= end_i <= 10^4
#
# Hints:
#   - Sort by start time first.
#   - Iterate and compare each interval's start with the last merged
#     interval's end.
#   - Ruby-style: sort_by + each_with_object makes this clean.
#
# ============================================================================

def merge(intervals)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMergeIntervals < Minitest::Test
  def test_example_1
    assert_equal [[1, 6], [8, 10], [15, 18]],
                 merge([[1, 3], [2, 6], [8, 10], [15, 18]])
  end

  def test_touching
    assert_equal [[1, 5]], merge([[1, 4], [4, 5]])
  end

  def test_no_overlap
    assert_equal [[1, 2], [4, 5]], merge([[1, 2], [4, 5]])
  end

  def test_all_overlap
    assert_equal [[1, 10]], merge([[1, 10], [2, 3], [4, 5], [6, 7]])
  end

  def test_single
    assert_equal [[1, 2]], merge([[1, 2]])
  end

  def test_unsorted_input
    assert_equal [[1, 6], [8, 10]], merge([[8, 10], [2, 6], [1, 3]])
  end
end
