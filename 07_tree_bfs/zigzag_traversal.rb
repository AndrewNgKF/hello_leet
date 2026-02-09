# frozen_string_literal: true

# ============================================================================
# Problem: Binary Tree Zigzag Level Order Traversal (LeetCode #103)
# Link:    https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
# Difficulty: Medium
# Pattern: Tree BFS
# ============================================================================
#
# Given the root of a binary tree, return the zigzag level order traversal
# of its nodes' values. (i.e., from left to right, then right to left for
# the next level and alternate between).
#
# Example 1:
#   Input:  root = [3,9,20,null,null,15,7]
#   Output: [[3],[20,9],[15,7]]
#
# Example 2:
#   Input:  root = [1]
#   Output: [[1]]
#
# Constraints:
#   - Number of nodes is in range [0, 2000]
#
# Hints:
#   - Standard BFS, but reverse every other level.
#   - Ruby-style: just do level_order then .each_with_index and reverse odds.
#
# ============================================================================

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def build_tree(values)
  return nil if values.nil? || values.empty? || values[0].nil?
  root = TreeNode.new(values[0])
  queue = [root]
  i = 1
  while i < values.length
    node = queue.shift
    break unless node
    if i < values.length && !values[i].nil?
      node.left = TreeNode.new(values[i])
      queue << node.left
    end
    i += 1
    if i < values.length && !values[i].nil?
      node.right = TreeNode.new(values[i])
      queue << node.right
    end
    i += 1
  end
  root
end

def zigzag_level_order(root)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestZigzag < Minitest::Test
  def test_example_1
    assert_equal [[3], [20, 9], [15, 7]],
                 zigzag_level_order(build_tree([3, 9, 20, nil, nil, 15, 7]))
  end

  def test_single
    assert_equal [[1]], zigzag_level_order(build_tree([1]))
  end

  def test_empty
    assert_equal [], zigzag_level_order(nil)
  end

  def test_four_levels
    root = build_tree([1, 2, 3, 4, 5, 6, 7])
    assert_equal [[1], [3, 2], [4, 5, 6, 7]], zigzag_level_order(root)
  end
end
