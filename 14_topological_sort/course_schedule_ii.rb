# frozen_string_literal: true

# ============================================================================
# Problem: Course Schedule II (LeetCode #210)
# Link:    https://leetcode.com/problems/course-schedule-ii/
# Difficulty: Medium
# Pattern: Topological Sort
# ============================================================================
#
# There are `numCourses` courses labeled 0 to numCourses - 1. Given
# prerequisites where prerequisites[i] = [a_i, b_i] means b_i must come
# before a_i, return the ordering of courses you should take. If there are
# many valid answers, return any. If impossible (cycle), return [].
#
# Example 1:
#   Input:  numCourses = 2, prerequisites = [[1,0]]
#   Output: [0,1]
#
# Example 2:
#   Input:  numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
#   Output: [0,1,2,3] or [0,2,1,3]
#
# Constraints:
#   - 1 <= numCourses <= 2000
#   - 0 <= prerequisites.length <= numCourses * (numCourses - 1)
#
# Hints:
#   - Same as Course Schedule I, but collect the order as you process.
#   - BFS: collect nodes as you dequeue them.
#   - DFS: collect nodes in reverse post-order (add to front when done).
#
# ============================================================================

def find_order(num_courses, prerequisites)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestCourseScheduleII < Minitest::Test
  def valid_order?(num_courses, prereqs, order)
    return false unless order.length == num_courses
    pos = {}
    order.each_with_index { |c, i| pos[c] = i }
    prereqs.all? { |a, b| pos[b] < pos[a] }
  end

  def test_simple
    order = find_order(2, [[1, 0]])
    assert valid_order?(2, [[1, 0]], order || [])
  end

  def test_diamond
    prereqs = [[1, 0], [2, 0], [3, 1], [3, 2]]
    order = find_order(4, prereqs)
    assert valid_order?(4, prereqs, order || [])
  end

  def test_no_prereqs
    order = find_order(3, [])
    assert_equal 3, (order || []).length
  end

  def test_cycle
    assert_equal [], (find_order(2, [[0, 1], [1, 0]]) || [])
  end

  def test_single
    assert_equal [0], find_order(1, [])
  end
end
