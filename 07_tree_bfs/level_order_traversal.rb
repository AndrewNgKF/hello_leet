# frozen_string_literal: true

# ============================================================================
# Problem: Binary Tree Level Order Traversal (LeetCode #102)
# Link:    https://leetcode.com/problems/binary-tree-level-order-traversal/
# Difficulty: Medium
# Pattern: Tree BFS
# ============================================================================
#
# Given the root of a binary tree, return the level order traversal of its
# nodes' values (i.e., from left to right, level by level).
#
# Example 1:
#   Input:  root = [3,9,20,null,null,15,7]
#   Output: [[3],[9,20],[15,7]]
#
# Example 2:
#   Input:  root = [1]
#   Output: [[1]]
#
# Example 3:
#   Input:  root = []
#   Output: []
#
# Constraints:
#   - Number of nodes is in range [0, 2000]
#   - -1000 <= Node.val <= 1000
#
# Hints:
#   - Use a queue. Process all nodes at the current level (queue.size times),
#     adding their children for the next level.
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

def level_order(root)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestLevelOrder < Minitest::Test
  def test_example_1
    assert_equal [[3], [9, 20], [15, 7]],
                 level_order(build_tree([3, 9, 20, nil, nil, 15, 7]))
  end

  def test_single_node
    assert_equal [[1]], level_order(build_tree([1]))
  end

  def test_empty
    assert_equal [], level_order(nil)
  end

  def test_left_skewed
    assert_equal [[1], [2], [3]], level_order(build_tree([1, 2, nil, 3]))
  end

  def test_complete_tree
    assert_equal [[1], [2, 3], [4, 5, 6, 7]],
                 level_order(build_tree([1, 2, 3, 4, 5, 6, 7]))
  end
end
