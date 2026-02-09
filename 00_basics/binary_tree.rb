# frozen_string_literal: true

# ============================================================================
# Basics: Binary Trees
# ============================================================================
#
# A binary tree is a hierarchical structure where each node has at most
# two children: left and right.
#
# Visual:
#         1           ← root
#        / \
#       2   3         ← children of 1
#      / \   \
#     4   5   6       ← leaves (no children) and internal node
#
# Key terminology:
#   Root   — the top node (1)
#   Leaf   — a node with no children (4, 5, 6)
#   Height — longest path from root to leaf (3 in this case)
#   Depth  — distance from root to a node (root has depth 0)
#
# Special types:
#   Binary Search Tree (BST) — left < node < right (for all nodes)
#   Balanced tree — height difference between left/right ≤ 1
#   Complete tree — all levels full except possibly the last
#
# ============================================================================

# ============================================================================
# THE NODE
# ============================================================================

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# ============================================================================
# BUILDING TREES FROM ARRAYS
# ============================================================================
#
# LeetCode represents trees as level-order arrays:
#   [1, 2, 3, 4, 5, nil, 6]
#
# This maps to:
#         1
#        / \
#       2   3
#      / \   \
#     4   5   6
#
# nil means "no node here"

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

# ============================================================================
# THE FOUR TRAVERSALS
# ============================================================================
#
# There are 4 ways to visit every node in a tree. Understanding these is
# critical — they're the basis of Tree DFS and Tree BFS patterns.
#
# The name refers to when you PROCESS the current node:

# 1. PRE-ORDER: Process Root FIRST, then left, then right
#    Visit order for our example tree: 1, 2, 4, 5, 3, 6
#    Use: copying a tree, serialization
def preorder(node, result = [])
  return result unless node
  result << node.val # process root
  preorder(node.left, result) # then left
  preorder(node.right, result) # then right
  result
end

# 2. IN-ORDER: Process left first, then Root, then right
#    Visit order: 4, 2, 5, 1, 3, 6
#    Use: BST gives sorted order! (left < root < right)
def inorder(node, result = [])
  return result unless node
  inorder(node.left, result) # left first
  result << node.val # process root
  inorder(node.right, result) # then right
  result
end

# 3. POST-ORDER: Process left and right first, then Root LAST
#    Visit order: 4, 5, 2, 6, 3, 1
#    Use: deleting a tree (delete children before parent), calculating heights
def postorder(node, result = [])
  return result unless node
  postorder(node.left, result) # left first
  postorder(node.right, result) # right first
  result << node.val # process root last
  result
end

# 4. LEVEL-ORDER (BFS): Process level by level, left to right
#    Visit order: [[1], [2, 3], [4, 5, 6]]
#    Use: finding shortest path, level-specific operations
def level_order(root)
  return [] unless root

  result = []
  queue = [root]

  until queue.empty?
    level_size = queue.length
    current_level = []

    level_size.times do
      node = queue.shift
      current_level << node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end

    result << current_level
  end

  result
end

# ============================================================================
# COMMON TREE OPERATIONS (read these, then implement them yourself below)
# ============================================================================

# Height of a tree (number of edges on longest root-to-leaf path)
def tree_height(node)
  return -1 unless node # empty tree has height -1 (by convention)
  1 + [tree_height(node.left), tree_height(node.right)].max
end

# Count total nodes
def count_nodes(node)
  return 0 unless node
  1 + count_nodes(node.left) + count_nodes(node.right)
end

# Check if a value exists in the tree
def tree_contains?(node, target)
  return false unless node
  return true if node.val == target
  tree_contains?(node.left, target) || tree_contains?(node.right, target)
end

# ============================================================================
# BINARY SEARCH TREE (BST)
# ============================================================================
#
# A BST maintains the invariant: left.val < node.val < right.val
# This enables O(log n) search in balanced trees!
#
#         8
#        / \
#       4   12
#      / \  / \
#     2  6 10 14
#
# In-order traversal of a BST gives sorted output: [2, 4, 6, 8, 10, 12, 14]

def bst_search(node, target)
  return nil unless node
  return node if node.val == target

  if target < node.val
    bst_search(node.left, target)
  else
    bst_search(node.right, target)
  end
end

def bst_insert(node, val)
  return TreeNode.new(val) unless node

  if val < node.val
    node.left = bst_insert(node.left, val)
  elsif val > node.val
    node.right = bst_insert(node.right, val)
  end

  node # return unchanged node if val already exists
end

# ============================================================================
# YOUR TURN — Challenges
# ============================================================================

# Challenge 1: Check if a binary tree is symmetric (mirror of itself).
# Example:
#       1
#      / \
#     2   2       ← symmetric
#    / \ / \
#   3  4 4  3
#
# Hint: Write a helper that compares two subtrees. The left subtree's left
#       should match the right subtree's right, and vice versa.
def is_symmetric?(root)
  # TODO: implement
end

# Challenge 2: Invert a binary tree (mirror it).
# Example:
#     1          1
#    / \   =>   / \
#   2   3     3   2
#
# Hint: Swap left and right, then recurse on both children.
def invert_tree(node)
  # TODO: implement — return the root
end

# Challenge 3: Check if a tree is a valid Binary Search Tree.
# Hint: Use in-order traversal (should be strictly increasing) or
#       pass min/max bounds down through recursion.
def valid_bst?(root)
  # TODO: implement
end

# Challenge 4: Find the lowest common ancestor of two nodes in a binary tree.
# The LCA is the deepest node that is an ancestor of both p and q.
# Hint: If the current node is p or q, return it.
#       Recurse left and right. If both return non-nil, current node is the LCA.
#       If only one side returns non-nil, that's the LCA.
def lowest_common_ancestor(root, p, q)
  # TODO: implement — p and q are VALUES (not nodes)
  # return the VALUE of the LCA
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestBinaryTree < Minitest::Test
  # --- Provided implementations ---
  def test_build_tree
    root = build_tree([1, 2, 3, 4, 5, nil, 6])
    assert_equal 1, root.val
    assert_equal 2, root.left.val
    assert_equal 3, root.right.val
    assert_equal 4, root.left.left.val
    assert_equal 5, root.left.right.val
    assert_nil root.right.left
    assert_equal 6, root.right.right.val
  end

  def test_preorder
    root = build_tree([1, 2, 3, 4, 5, nil, 6])
    assert_equal [1, 2, 4, 5, 3, 6], preorder(root)
  end

  def test_inorder
    root = build_tree([1, 2, 3, 4, 5, nil, 6])
    assert_equal [4, 2, 5, 1, 3, 6], inorder(root)
  end

  def test_postorder
    root = build_tree([1, 2, 3, 4, 5, nil, 6])
    assert_equal [4, 5, 2, 6, 3, 1], postorder(root)
  end

  def test_level_order
    root = build_tree([1, 2, 3, 4, 5, nil, 6])
    assert_equal [[1], [2, 3], [4, 5, 6]], level_order(root)
  end

  def test_tree_height
    root = build_tree([1, 2, 3, 4, 5])
    assert_equal 2, tree_height(root)
    assert_equal(-1, tree_height(nil))
  end

  def test_count_nodes
    root = build_tree([1, 2, 3, 4, 5])
    assert_equal 5, count_nodes(root)
    assert_equal 0, count_nodes(nil)
  end

  def test_bst_search
    root = nil
    [8, 4, 12, 2, 6, 10, 14].each { |v| root = bst_insert(root, v) }
    assert_equal 6, bst_search(root, 6).val
    assert_nil bst_search(root, 99)
  end

  def test_bst_inorder_is_sorted
    root = nil
    [8, 4, 12, 2, 6, 10, 14].each { |v| root = bst_insert(root, v) }
    assert_equal [2, 4, 6, 8, 10, 12, 14], inorder(root)
  end

  # --- Your Turn challenges ---
  def test_is_symmetric
    root = build_tree([1, 2, 2, 3, 4, 4, 3])
    assert is_symmetric?(root)
  end

  def test_is_not_symmetric
    root = build_tree([1, 2, 2, nil, 3, nil, 3])
    refute is_symmetric?(root)
  end

  def test_symmetric_single_node
    assert is_symmetric?(TreeNode.new(1))
  end

  def test_symmetric_empty
    assert is_symmetric?(nil)
  end

  def test_invert_tree
    root = build_tree([1, 2, 3])
    inverted = invert_tree(root)
    refute_nil inverted, "invert_tree should return the root node"
    assert_equal 3, inverted.left.val
    assert_equal 2, inverted.right.val
  end

  def test_invert_tree_deeper
    root = build_tree([4, 2, 7, 1, 3, 6, 9])
    inverted = invert_tree(root)
    refute_nil inverted
    assert_equal [9, 7, 6, 4, 3, 2, 1], inorder(inverted)
  end

  def test_invert_nil
    assert_nil invert_tree(nil)
  end

  def test_valid_bst
    root = nil
    [8, 4, 12, 2, 6, 10, 14].each { |v| root = bst_insert(root, v) }
    assert valid_bst?(root)
  end

  def test_invalid_bst
    #     5
    #    / \
    #   1   4  ← 4 < 5, but it's on the right!
    root = build_tree([5, 1, 4, nil, nil, 3, 6])
    refute valid_bst?(root)
  end

  def test_valid_bst_single_node
    assert valid_bst?(TreeNode.new(1))
  end

  def test_lowest_common_ancestor
    root = build_tree([3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
    assert_equal 3, lowest_common_ancestor(root, 5, 1)
    assert_equal 5, lowest_common_ancestor(root, 5, 4)
  end

  def test_lca_same_node
    root = build_tree([1, 2])
    assert_equal 1, lowest_common_ancestor(root, 1, 2)
  end
end
