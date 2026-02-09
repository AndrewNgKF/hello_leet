# frozen_string_literal: true

# ============================================================================
# Problem: Maximum Depth of Binary Tree (LeetCode #104)
# Link:    https://leetcode.com/problems/maximum-depth-of-binary-tree/
# Difficulty: Easy
# Pattern: Tree DFS
# ============================================================================
#
# Given the root of a binary tree, return its maximum depth.
#
# A binary tree's maximum depth is the number of nodes along the longest
# path from the root node down to the farthest leaf node.
#
# Example 1:
#   Input:  root = [3, 9, 20, nil, nil, 15, 7]
#              3
#             / \
#            9  20
#              /  \
#             15   7
#   Output: 3
#
# Example 2:
#   Input:  root = [1, nil, 2]
#   Output: 2
#
# Constraints:
#   - The number of nodes is in the range [0, 10^4]
#   - -100 <= Node.val <= 100
#
# Hints:
#   - Base case: an empty tree has depth 0.
#   - Recursive case: depth = 1 + max(depth of left, depth of right).
#
# ============================================================================

# Simple TreeNode class for tree problems
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# Helper: build a tree from a level-order array (LeetCode style)
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

def max_depth(root)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMaxDepth < Minitest::Test
  def test_example_1
    root = build_tree([3, 9, 20, nil, nil, 15, 7])
    assert_equal 3, max_depth(root)
  end

  def test_example_2
    root = build_tree([1, nil, 2])
    assert_equal 2, max_depth(root)
  end

  def test_empty_tree
    assert_equal 0, max_depth(nil)
  end

  def test_single_node
    assert_equal 1, max_depth(TreeNode.new(1))
  end

  def test_left_skewed
    root = build_tree([1, 2, nil, 3, nil])
    assert_equal 3, max_depth(root)
  end
end
