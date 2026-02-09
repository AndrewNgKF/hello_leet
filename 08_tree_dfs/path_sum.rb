# frozen_string_literal: true

# ============================================================================
# Problem: Path Sum (LeetCode #112)
# Link:    https://leetcode.com/problems/path-sum/
# Difficulty: Easy
# Pattern: Tree DFS
# ============================================================================
#
# Given the root of a binary tree and an integer `target_sum`, return true
# if the tree has a root-to-leaf path such that adding up all the values
# along the path equals `target_sum`.
#
# A leaf is a node with no children.
#
# Example 1:
#   Input:  root = [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1], targetSum = 22
#              5
#             / \
#            4   8
#           /   / \
#          11  13  4
#         / \       \
#        7   2       1
#   Output: true
#   Explanation: The path 5 → 4 → 11 → 2 sums to 22.
#
# Example 2:
#   Input:  root = [1, 2, 3], targetSum = 5
#   Output: false
#
# Example 3:
#   Input:  root = [], targetSum = 0
#   Output: false
#
# Constraints:
#   - The number of nodes is in the range [0, 5000]
#   - -1000 <= Node.val <= 1000
#   - -1000 <= targetSum <= 1000
#
# Hints:
#   - Subtract the current node's value from the target as you go deeper.
#   - At a leaf, check if the remaining target equals the leaf's value.
#   - An empty tree always returns false (even for target 0).
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

def has_path_sum(root, target_sum)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestPathSum < Minitest::Test
  def test_example_1
    root = build_tree([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1])
    assert_equal true, has_path_sum(root, 22)
  end

  def test_no_path
    root = build_tree([1, 2, 3])
    assert_equal false, has_path_sum(root, 5)
  end

  def test_empty_tree
    assert_equal false, has_path_sum(nil, 0)
  end

  def test_single_node_match
    assert_equal true, has_path_sum(TreeNode.new(5), 5)
  end

  def test_single_node_no_match
    assert_equal false, has_path_sum(TreeNode.new(5), 1)
  end

  def test_negative_values
    root = build_tree([-2, nil, -3])
    assert_equal true, has_path_sum(root, -5)
  end
end
