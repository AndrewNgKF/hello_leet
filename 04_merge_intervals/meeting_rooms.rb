# frozen_string_literal: true

# ============================================================================
# Problem: Meeting Rooms II (LeetCode #253)
# Link:    https://leetcode.com/problems/meeting-rooms-ii/
# Difficulty: Medium
# Pattern: Merge Intervals
# ============================================================================
#
# Given an array of meeting time intervals `intervals` where
# intervals[i] = [start_i, end_i], return the minimum number of
# conference rooms required.
#
# Example 1:
#   Input:  intervals = [[0,30],[5,10],[15,20]]
#   Output: 2
#   Explanation: Room 1: [0,30], Room 2: [5,10] then [15,20].
#
# Example 2:
#   Input:  intervals = [[7,10],[2,4]]
#   Output: 1
#
# Constraints:
#   - 1 <= intervals.length <= 10^4
#   - 0 <= start_i < end_i <= 10^6
#
# Hints:
#   - Approach 1: Separate starts and ends, sort both arrays. Walk through
#     with two pointers — a start means +1 room, an end means -1 room.
#   - Approach 2: "Event line sweep" — create +1 events for starts, -1 for
#     ends, sort, sweep to find peak.
#   - Ruby-style: flat_map to events, sort, scan for running max.
#
# ============================================================================

def min_meeting_rooms(intervals)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMeetingRooms < Minitest::Test
  def test_overlapping
    assert_equal 2, min_meeting_rooms([[0, 30], [5, 10], [15, 20]])
  end

  def test_no_overlap
    assert_equal 1, min_meeting_rooms([[7, 10], [2, 4]])
  end

  def test_all_overlap
    assert_equal 3, min_meeting_rooms([[1, 5], [2, 6], [3, 7]])
  end

  def test_single
    assert_equal 1, min_meeting_rooms([[0, 10]])
  end

  def test_sequential
    assert_equal 1, min_meeting_rooms([[1, 2], [2, 3], [3, 4]])
  end

  def test_all_same_time
    assert_equal 4, min_meeting_rooms([[0, 5], [0, 5], [0, 5], [0, 5]])
  end
end
