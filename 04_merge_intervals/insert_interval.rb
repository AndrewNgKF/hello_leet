# frozen_string_literal: true

# ============================================================================
# Problem: Insert Interval (LeetCode #57)
# Link:    https://leetcode.com/problems/insert-interval/
# Difficulty: Medium
# Pattern: Merge Intervals
# ============================================================================
#
# You are given an array of non-overlapping intervals `intervals` where
# intervals[i] = [start_i, end_i] sorted in ascending order by start_i.
# You are also given an interval `new_interval` = [start, end].
#
# Insert new_interval into intervals such that intervals is still sorted
# and non-overlapping (merge if necessary).
#
# Return intervals after the insertion.
#
# Example 1:
#   Input:  intervals = [[1,3],[6,9]], newInterval = [2,5]
#   Output: [[1,5],[6,9]]
#
# Example 2:
#   Input:  intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
#   Output: [[1,2],[3,10],[12,16]]
#
# Constraints:
#   - 0 <= intervals.length <= 10^4
#   - intervals is sorted by start_i
#   - newInterval.length == 2
#
# Hints:
#   - Three phases: (1) add all intervals that come entirely before new_interval,
#     (2) merge all overlapping intervals with new_interval,
#     (3) add all intervals that come entirely after.
#   - Two intervals overlap if start1 <= end2 AND start2 <= end1.
#
# ============================================================================

def insert(intervals, new_interval)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestInsertInterval < Minitest::Test
  def test_example_1
    assert_equal [[1, 5], [6, 9]], insert([[1, 3], [6, 9]], [2, 5])
  end

  def test_example_2
    assert_equal [[1, 2], [3, 10], [12, 16]],
                 insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8])
  end

  def test_no_overlap_before
    assert_equal [[1, 2], [5, 6]], insert([[5, 6]], [1, 2])
  end

  def test_no_overlap_after
    assert_equal [[1, 2], [5, 6]], insert([[1, 2]], [5, 6])
  end

  def test_empty_intervals
    assert_equal [[5, 7]], insert([], [5, 7])
  end

  def test_merge_all
    assert_equal [[0, 10]], insert([[1, 2], [3, 4], [5, 6]], [0, 10])
  end
end
