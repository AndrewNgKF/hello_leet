# frozen_string_literal: true

# ============================================================================
# Problem: Binary Tree Right Side View (LeetCode #199)
# Link:    https://leetcode.com/problems/binary-tree-right-side-view/
# Difficulty: Medium
# Pattern: Tree BFS
# ============================================================================
#
# Given the root of a binary tree, imagine yourself standing on the right
# side of it, return the values of the nodes you can see ordered from top
# to bottom.
#
# Example 1:
#   Input:  root = [1,2,3,null,5,null,4]
#   Output: [1,3,4]
#
# Example 2:
#   Input:  root = [1,null,3]
#   Output: [1,3]
#
# Example 3:
#   Input:  root = []
#   Output: []
#
# Constraints:
#   - Number of nodes is in range [0, 100]
#
# Hints:
#   - BFS level by level, take the LAST node of each level.
#   - Or DFS with right-first traversal, taking the first node at each depth.
#   - Ruby-style: level_order(root).map(&:last)
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

def right_side_view(root)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestRightSideView < Minitest::Test
  def test_example_1
    assert_equal [1, 3, 4],
                 right_side_view(build_tree([1, 2, 3, nil, 5, nil, 4]))
  end

  def test_right_only
    assert_equal [1, 3], right_side_view(build_tree([1, nil, 3]))
  end

  def test_empty
    assert_equal [], right_side_view(nil)
  end

  def test_left_deeper
    # Left side extends deeper, so we see the left node at the bottom level
    root = build_tree([1, 2, 3, 4])
    assert_equal [1, 3, 4], right_side_view(root)
  end
end
