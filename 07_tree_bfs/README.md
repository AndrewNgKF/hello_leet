# Pattern 7: Tree BFS (Breadth-First Search)

## Core Idea

Traverse a tree **level by level** using a queue. Process all nodes at the current depth before moving to the next depth.

## When to Use

- **Level-order** traversal
- Finding the **minimum depth** (BFS finds it first)
- Level-specific operations (averages, zigzag, right-side view)
- **Shortest path** in unweighted graphs

## Template

```ruby
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
```

## Complexity

- **Time:** O(n) — visit every node once
- **Space:** O(w) where w is the maximum width of the tree (up to n/2)

## Problems in This Folder

| File                       | Problem                                  | Difficulty | LeetCode # |
| -------------------------- | ---------------------------------------- | ---------- | ---------- |
| `level_order_traversal.rb` | Binary Tree Level Order Traversal        | Medium     | 102        |
| `zigzag_traversal.rb`      | Binary Tree Zigzag Level Order Traversal | Medium     | 103        |
| `right_side_view.rb`       | Binary Tree Right Side View              | Medium     | 199        |
