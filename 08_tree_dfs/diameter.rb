# frozen_string_literal: true

# ============================================================================
# Problem: Diameter of Binary Tree (LeetCode #543)
# Link:    https://leetcode.com/problems/diameter-of-binary-tree/
# Difficulty: Easy
# Pattern: Tree DFS
# ============================================================================
#
# Given the root of a binary tree, return the length of the diameter of
# the tree.
#
# The diameter of a binary tree is the length of the longest path between
# any two nodes in a tree. This path may or may not pass through the root.
#
# The length of a path between two nodes is represented by the number of
# edges between them.
#
# Example 1:
#   Input:  root = [1, 2, 3, 4, 5]
#              1
#             / \
#            2   3
#           / \
#          4   5
#   Output: 3
#   Explanation: The path is [4, 2, 1, 3] or [5, 2, 1, 3] — 3 edges.
#
# Example 2:
#   Input:  root = [1, 2]
#   Output: 1
#
# Constraints:
#   - The number of nodes is in the range [1, 10^4]
#   - -100 <= Node.val <= 100
#
# Hints:
#   - For each node, the path through it = left_height + right_height.
#   - Use DFS to compute the height, and at each node, update the global
#     max diameter.
#   - Return height to the parent, but track diameter as a side effect.
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

def diameter_of_binary_tree(root)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestDiameter < Minitest::Test
  def test_example_1
    root = build_tree([1, 2, 3, 4, 5])
    assert_equal 3, diameter_of_binary_tree(root)
  end

  def test_example_2
    root = build_tree([1, 2])
    assert_equal 1, diameter_of_binary_tree(root)
  end

  def test_single_node
    assert_equal 0, diameter_of_binary_tree(TreeNode.new(1))
  end

  def test_not_through_root
    #       1
    #      /
    #     2
    #    / \
    #   3   4
    #  /     \
    # 5       6
    root = TreeNode.new(1)
    root.left = TreeNode.new(2)
    root.left.left = TreeNode.new(3)
    root.left.right = TreeNode.new(4)
    root.left.left.left = TreeNode.new(5)
    root.left.right.right = TreeNode.new(6)
    assert_equal 4, diameter_of_binary_tree(root)
  end
end
