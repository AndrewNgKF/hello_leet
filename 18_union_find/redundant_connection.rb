# frozen_string_literal: true

# ============================================================================
# Problem: Redundant Connection (LeetCode #684)
# Link:    https://leetcode.com/problems/redundant-connection/
# Difficulty: Medium
# Pattern: Union Find
# ============================================================================
#
# In this problem, a tree is an undirected graph that is connected and has
# no cycles. You are given a graph that started as a tree with n nodes
# (labeled 1 to n) with one additional edge added. The added edge connects
# two vertices that are already connected.
#
# Return an edge that can be removed so the result is a tree. If there are
# multiple answers, return the edge that occurs last in the input.
#
# Example 1:
#   Input:  edges = [[1,2],[1,3],[2,3]]
#   Output: [2,3]
#
# Example 2:
#   Input:  edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]
#   Output: [1,4]
#
# Constraints:
#   - n == edges.length
#   - 3 <= n <= 1000
#   - 1 <= edges[i][0] < edges[i][1] <= n
#
# Hints:
#   - Classic Union Find problem. Process edges one by one.
#   - If two nodes are already in the same component when you try to union
#     them, that edge creates a cycle — it's the redundant one.
#
# ============================================================================

def find_redundant_connection(edges)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestRedundantConnection < Minitest::Test
  def test_example_1
    assert_equal [2, 3], find_redundant_connection([[1, 2], [1, 3], [2, 3]])
  end

  def test_example_2
    assert_equal [1, 4],
                 find_redundant_connection(
                   [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]
                 )
  end

  def test_triangle
    assert_equal [1, 3], find_redundant_connection([[1, 2], [2, 3], [1, 3]])
  end

  def test_last_edge_is_redundant
    assert_equal [3, 1], find_redundant_connection([[1, 2], [2, 3], [3, 1]])
  end
end
