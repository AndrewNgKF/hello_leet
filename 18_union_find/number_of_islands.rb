# frozen_string_literal: true

# ============================================================================
# Problem: Number of Islands (LeetCode #200)
# Link:    https://leetcode.com/problems/number-of-islands/
# Difficulty: Medium
# Pattern: Union Find
# ============================================================================
#
# Given an m x n 2D binary grid `grid` which represents a map of '1's
# (land) and '0's (water), return the number of islands.
#
# An island is surrounded by water and is formed by connecting adjacent
# lands horizontally or vertically.
#
# Example 1:
#   Input: grid = [
#     ["1","1","1","1","0"],
#     ["1","1","0","1","0"],
#     ["1","1","0","0","0"],
#     ["0","0","0","0","0"]
#   ]
#   Output: 1
#
# Example 2:
#   Input: grid = [
#     ["1","1","0","0","0"],
#     ["1","1","0","0","0"],
#     ["0","0","1","0","0"],
#     ["0","0","0","1","1"]
#   ]
#   Output: 3
#
# Constraints:
#   - m == grid.length, n == grid[i].length
#   - 1 <= m, n <= 300
#   - grid[i][j] is '0' or '1'
#
# Hints:
#   - Union Find approach: for each '1', union it with its right/down
#     neighbors if they're also '1'. Count remaining distinct components.
#   - DFS/BFS approach also works: flood-fill each unvisited '1'.
#
# ============================================================================

class UnionFind
  attr_reader :count

  def initialize(n)
    @parent = (0...n).to_a
    @rank = Array.new(n, 0)
    @count = 0
  end

  def add
    @count += 1
  end

  def find(x)
    @parent[x] = find(@parent[x]) while @parent[x] != x
    # Path compression (iterative to avoid stack overflow):
    root = x
    root = @parent[root] while @parent[root] != root
    @parent[x], x = root, @parent[x] while @parent[x] != root
    root
  end

  def union(x, y)
    rx, ry = find(x), find(y)
    return if rx == ry
    if @rank[rx] < @rank[ry]
      @parent[rx] = ry
    elsif @rank[rx] > @rank[ry]
      @parent[ry] = rx
    else
      @parent[ry] = rx
      @rank[rx] += 1
    end
    @count -= 1
  end
end

def num_islands(grid)
  # TODO: implement using UnionFind (or DFS/BFS — your choice!)
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestNumIslands < Minitest::Test
  def test_one_island
    grid = [%w[1 1 1 1 0], %w[1 1 0 1 0], %w[1 1 0 0 0], %w[0 0 0 0 0]]
    assert_equal 1, num_islands(grid)
  end

  def test_three_islands
    grid = [%w[1 1 0 0 0], %w[1 1 0 0 0], %w[0 0 1 0 0], %w[0 0 0 1 1]]
    assert_equal 3, num_islands(grid)
  end

  def test_all_water
    assert_equal 0, num_islands([%w[0 0], %w[0 0]])
  end

  def test_all_land
    assert_equal 1, num_islands([%w[1 1], %w[1 1]])
  end

  def test_checkerboard
    grid = [%w[1 0 1], %w[0 1 0], %w[1 0 1]]
    assert_equal 5, num_islands(grid)
  end
end
