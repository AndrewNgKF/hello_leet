# Pattern 8: Tree DFS (Depth-First Search)

## Core Idea

Explore a tree by going **as deep as possible** along each branch before backtracking. Use recursion or an explicit stack.

## When to Use

- Path-related problems (path sum, all paths, max path)
- Tree **depth/height** calculations
- Checking tree **properties** (balanced, symmetric, same)
- Problems requiring **backtracking** through the tree

## The Three Traversals

```ruby
# Pre-order: Root → Left → Right (process root first)
def preorder(node)
  return unless node
  process(node.val)
  preorder(node.left)
  preorder(node.right)
end

# In-order: Left → Root → Right (gives sorted order for BST)
def inorder(node)
  return unless node
  inorder(node.left)
  process(node.val)
  inorder(node.right)
end

# Post-order: Left → Right → Root (process children first)
def postorder(node)
  return unless node
  postorder(node.left)
  postorder(node.right)
  process(node.val)
end
```

## Template — Path Sum Style

```ruby
def has_path_sum(node, target)
  return false unless node
  return target == node.val if node.left.nil? && node.right.nil?  # leaf

  remaining = target - node.val
  has_path_sum(node.left, remaining) || has_path_sum(node.right, remaining)
end
```

## Complexity

- **Time:** O(n)
- **Space:** O(h) where h is the height (O(log n) balanced, O(n) worst case)

## Problems in This Folder

| File           | Problem                      | Difficulty | LeetCode # |
| -------------- | ---------------------------- | ---------- | ---------- |
| `max_depth.rb` | Maximum Depth of Binary Tree | Easy       | 104        |
| `path_sum.rb`  | Path Sum                     | Easy       | 112        |
| `diameter.rb`  | Diameter of Binary Tree      | Easy       | 543        |
