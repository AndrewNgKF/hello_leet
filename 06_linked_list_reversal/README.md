# Pattern 6: In-place Linked List Reversal

## Core Idea

Reverse the direction of pointers in a linked list **in-place** using three pointers: `prev`, `curr`, and `next_node`.

## When to Use

- Reverse a linked list (or a portion of it)
- Reverse nodes in groups of k
- Palindrome linked list detection

## Template

```ruby
def reverse(head)
  prev = nil
  curr = head

  while curr
    next_node = curr.next
    curr.next = prev
    prev = curr
    curr = next_node
  end

  prev  # new head
end
```

## Complexity

- **Time:** O(n)
- **Space:** O(1)

## Problems in This Folder

| File                        | Problem                  | Difficulty | LeetCode # |
| --------------------------- | ------------------------ | ---------- | ---------- |
| `reverse_linked_list.rb`    | Reverse Linked List      | Easy       | 206        |
| `reverse_linked_list_ii.rb` | Reverse Linked List II   | Medium     | 92         |
| `reverse_nodes_k_group.rb`  | Reverse Nodes in k-Group | Hard       | 25         |
