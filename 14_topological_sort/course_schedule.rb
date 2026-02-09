# frozen_string_literal: true

# ============================================================================
# Problem: Course Schedule (LeetCode #207)
# Link:    https://leetcode.com/problems/course-schedule/
# Difficulty: Medium
# Pattern: Topological Sort
# ============================================================================
#
# There are a total of `numCourses` courses you have to take, labeled
# from 0 to numCourses - 1. You are given an array `prerequisites` where
# prerequisites[i] = [a_i, b_i] means you must take course b_i before a_i.
#
# Return true if you can finish all courses. (i.e., no cycle in the
# prerequisite graph.)
#
# Example 1:
#   Input:  numCourses = 2, prerequisites = [[1,0]]
#   Output: true
#   Explanation: Take 0 then 1.
#
# Example 2:
#   Input:  numCourses = 2, prerequisites = [[1,0],[0,1]]
#   Output: false
#   Explanation: Cycle! 0 → 1 → 0.
#
# Constraints:
#   - 1 <= numCourses <= 2000
#   - 0 <= prerequisites.length <= 5000
#
# Hints:
#   - Build a directed graph and compute in-degrees.
#   - BFS (Kahn's algorithm): start from nodes with in-degree 0, process
#     neighbors, count processed nodes. If count == numCourses, no cycle.
#   - DFS alternative: detect back edges using visited states (unvisited,
#     in-progress, completed).
#
# ============================================================================

def can_finish(num_courses, prerequisites)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestCourseSchedule < Minitest::Test
  def test_no_cycle
    assert can_finish(2, [[1, 0]])
  end

  def test_cycle
    refute can_finish(2, [[1, 0], [0, 1]])
  end

  def test_no_prereqs
    assert can_finish(3, [])
  end

  def test_chain
    assert can_finish(4, [[1, 0], [2, 1], [3, 2]])
  end

  def test_complex_cycle
    refute can_finish(3, [[0, 1], [1, 2], [2, 0]])
  end

  def test_single_course
    assert can_finish(1, [])
  end
end
