# frozen_string_literal: true

# ============================================================================
# Basics: Graphs — Adjacency List, BFS, DFS
# ============================================================================
#
# A graph is a set of nodes (vertices) connected by edges.
#
# Types:
#   Directed: edges have a direction (A → B doesn't mean B → A)
#   Undirected: edges go both ways (A — B means A → B and B → A)
#   Weighted: edges have costs/distances
#   Unweighted: all edges are equal
#
# Visual (undirected):
#     0 --- 1
#     |     |
#     3 --- 2
#
# ============================================================================

# ============================================================================
# ADJACENCY LIST — The standard representation
# ============================================================================
#
# A hash (or array) where each key is a node and the value is a list of
# its neighbors.
#
# For the graph above:
#   { 0 => [1, 3], 1 => [0, 2], 2 => [1, 3], 3 => [0, 2] }
#
# Why not a matrix? Adjacency lists use O(V + E) space vs O(V²) for a
# matrix. Most interview graphs are sparse, so lists win.

# Build an undirected graph from an edge list
def build_graph(edges, num_nodes = nil)
  graph = Hash.new { |h, k| h[k] = [] }

  edges.each do |from, to|
    graph[from] << to
    graph[to] << from # remove this line for directed graphs
  end

  # Ensure isolated nodes are in the graph
  (0...num_nodes).each { |i| graph[i] unless graph.key?(i) } if num_nodes

  graph
end

# Build a directed graph from an edge list
def build_directed_graph(edges)
  graph = Hash.new { |h, k| h[k] = [] }
  edges.each { |from, to| graph[from] << to }
  graph
end

# ============================================================================
# BFS — Breadth-First Search
# ============================================================================
#
# Explore all neighbors at the current depth before going deeper.
# Uses a QUEUE. Finds the shortest path in unweighted graphs.
#
# Time: O(V + E)   Space: O(V)

def bfs(graph, start)
  visited = Set.new([start])
  queue = [start]
  result = []

  until queue.empty?
    node = queue.shift
    result << node

    graph[node].each do |neighbor|
      unless visited.include?(neighbor)
        visited.add(neighbor)
        queue << neighbor
      end
    end
  end

  result
end

# BFS to find shortest path between two nodes (returns distance, or -1)
def bfs_shortest_path(graph, start, target)
  return 0 if start == target

  visited = Set.new([start])
  queue = [[start, 0]] # [node, distance]

  until queue.empty?
    node, dist = queue.shift

    graph[node].each do |neighbor|
      return dist + 1 if neighbor == target
      unless visited.include?(neighbor)
        visited.add(neighbor)
        queue << [neighbor, dist + 1]
      end
    end
  end

  -1 # not reachable
end

# ============================================================================
# DFS — Depth-First Search
# ============================================================================
#
# Go as deep as possible, then backtrack. Uses a STACK (or recursion).
# Great for: exploring all paths, detecting cycles, topological sort.
#
# Time: O(V + E)   Space: O(V)

# Iterative DFS (using an explicit stack)
def dfs_iterative(graph, start)
  visited = Set.new
  stack = [start]
  result = []

  until stack.empty?
    node = stack.pop
    next if visited.include?(node)

    visited.add(node)
    result << node

    # Push neighbors (reverse to get left-to-right order)
    graph[node].reverse_each do |neighbor|
      stack << neighbor unless visited.include?(neighbor)
    end
  end

  result
end

# Recursive DFS
def dfs_recursive(graph, node, visited = Set.new, result = [])
  return result if visited.include?(node)

  visited.add(node)
  result << node

  graph[node].each do |neighbor|
    dfs_recursive(graph, neighbor, visited, result)
  end

  result
end

# ============================================================================
# CONNECTED COMPONENTS
# ============================================================================
#
# In an undirected graph, a connected component is a group of nodes where
# you can reach any node from any other node within the group.

def count_components(num_nodes, edges)
  graph = build_graph(edges, num_nodes)
  visited = Set.new
  count = 0

  (0...num_nodes).each do |node|
    unless visited.include?(node)
      # BFS/DFS to visit all nodes in this component
      queue = [node]
      while (current = queue.shift)
        next if visited.include?(current)
        visited.add(current)
        graph[current].each { |n| queue << n unless visited.include?(n) }
      end
      count += 1
    end
  end

  count
end

# ============================================================================
# GRID AS A GRAPH
# ============================================================================
#
# Many LeetCode problems use a 2D grid as an implicit graph:
#   - Each cell is a node
#   - Neighbors are adjacent cells (up, down, left, right)
#
# You don't need to build an adjacency list — just compute neighbors on the fly.

DIRECTIONS = [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze

def grid_neighbors(row, col, rows, cols)
  DIRECTIONS.filter_map do |dr, dc|
    nr, nc = row + dr, col + dc
    [nr, nc] if nr.between?(0, rows - 1) && nc.between?(0, cols - 1)
  end
end

# ============================================================================
# YOUR TURN — Challenges
# ============================================================================

require "set"

# Challenge 1: Number of Islands (LeetCode #200)
# Given a 2D grid of '1's (land) and '0's (water), count the number of islands.
# An island is surrounded by water and is formed by connecting adjacent lands
# horizontally or vertically.
#
# Example:
#   grid = [
#     ["1","1","0","0","0"],
#     ["1","1","0","0","0"],
#     ["0","0","1","0","0"],
#     ["0","0","0","1","1"]
#   ]
#   => 3
#
# Hint: Scan every cell. When you find a '1', BFS/DFS to mark the entire
#       island as visited, and increment your count.
def num_islands(grid)
  # TODO: implement
end

# Challenge 2: Check if a path exists between two nodes.
# Given num_nodes, edge list, and source/destination, return true/false.
# Hint: Build the graph, then BFS or DFS from source.
def path_exists?(num_nodes, edges, source, destination)
  # TODO: implement
end

# Challenge 3: Clone a graph.
# Given a node in a connected undirected graph, return a deep copy.
# Each node has a val and a list of neighbors.
#
# Hint: Use a hash map {original_node => cloned_node} and BFS/DFS.
#       When you visit a neighbor, clone it if you haven't yet.
class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val = 0, neighbors = [])
    @val = val
    @neighbors = neighbors
  end
end

def clone_graph(node)
  # TODO: implement — return the cloned node corresponding to the input node
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestGraph < Minitest::Test
  # --- Provided implementations ---
  def test_build_graph
    graph = build_graph([[0, 1], [1, 2], [2, 3], [3, 0]])
    assert_includes graph[0], 1
    assert_includes graph[0], 3
    assert_includes graph[1], 0
  end

  def test_bfs
    graph = build_graph([[0, 1], [0, 2], [1, 3], [2, 3]])
    result = bfs(graph, 0)
    assert_equal 0, result.first
    assert_equal 4, result.length # visits all nodes
  end

  def test_bfs_shortest_path
    graph = build_graph([[0, 1], [0, 2], [1, 3], [2, 3], [3, 4]])
    assert_equal 2, bfs_shortest_path(graph, 0, 3)
    assert_equal 3, bfs_shortest_path(graph, 0, 4)
    assert_equal 0, bfs_shortest_path(graph, 0, 0)
  end

  def test_dfs_iterative
    graph = build_graph([[0, 1], [0, 2], [1, 3], [2, 3]])
    result = dfs_iterative(graph, 0)
    assert_equal 0, result.first
    assert_equal 4, result.length
  end

  def test_dfs_recursive
    graph = build_graph([[0, 1], [0, 2], [1, 3], [2, 3]])
    result = dfs_recursive(graph, 0)
    assert_equal 0, result.first
    assert_equal 4, result.length
  end

  def test_count_components
    assert_equal 2, count_components(5, [[0, 1], [1, 2], [3, 4]])
    assert_equal 3, count_components(5, [[0, 1], [2, 3]])
    assert_equal 1, count_components(3, [[0, 1], [1, 2]])
  end

  def test_grid_neighbors
    neighbors = grid_neighbors(0, 0, 3, 3)
    assert_includes neighbors, [0, 1]
    assert_includes neighbors, [1, 0]
    assert_equal 2, neighbors.length # corner has 2 neighbors
  end

  # --- Your Turn challenges ---
  def test_num_islands
    grid = [%w[1 1 0 0 0], %w[1 1 0 0 0], %w[0 0 1 0 0], %w[0 0 0 1 1]]
    assert_equal 3, num_islands(grid)
  end

  def test_num_islands_single
    assert_equal 1, num_islands([["1"]])
    assert_equal 0, num_islands([["0"]])
  end

  def test_num_islands_all_land
    grid = [%w[1 1], %w[1 1]]
    assert_equal 1, num_islands(grid)
  end

  def test_path_exists
    assert path_exists?(5, [[0, 1], [1, 2], [2, 3], [3, 4]], 0, 4)
    refute path_exists?(5, [[0, 1], [2, 3]], 0, 3)
    assert path_exists?(3, [[0, 1], [1, 2]], 0, 0)
  end

  def test_clone_graph
    # Build: 1 - 2 - 3
    n1 = GraphNode.new(1)
    n2 = GraphNode.new(2)
    n3 = GraphNode.new(3)
    n1.neighbors = [n2]
    n2.neighbors = [n1, n3]
    n3.neighbors = [n2]

    cloned = clone_graph(n1)

    # Must be different objects
    refute_same n1, cloned
    refute_same n2, cloned.neighbors[0]

    # But same structure
    assert_equal 1, cloned.val
    assert_equal 2, cloned.neighbors[0].val
    assert_equal 3, cloned.neighbors[0].neighbors[1].val
  end

  def test_clone_graph_nil
    assert_nil clone_graph(nil)
  end
end
