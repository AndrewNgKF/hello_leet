# Pattern 3: Fast & Slow Pointers

## Core Idea

Use two pointers moving at **different speeds** through a linked list or sequence. The fast pointer moves 2 steps while the slow moves 1. They'll meet if there's a cycle, or the fast one reaches the end if there isn't.

Also known as **Floyd's Tortoise and Hare** algorithm.

## When to Use

- **Cycle detection** in linked lists or sequences
- Finding the **middle** of a linked list
- Finding the **start of a cycle**
- Problems involving **repeated function application** (like Happy Number)

## Template

```ruby
# Cycle detection
slow = head
fast = head

while fast && fast.next
  slow = slow.next
  fast = fast.next.next
  return true if slow == fast  # cycle found
end

false  # no cycle
```

```ruby
# Finding the middle
slow = head
fast = head

while fast && fast.next
  slow = slow.next
  fast = fast.next.next
end

slow  # this is the middle node
```

## Complexity

- **Time:** O(n)
- **Space:** O(1) — no extra data structures needed

## Why It Works

If there's a cycle of length C, the fast pointer gains 1 step per iteration on the slow pointer. After at most C iterations inside the cycle, they'll overlap.

## Problems in This Folder

| File                   | Problem                   | Difficulty | LeetCode # |
| ---------------------- | ------------------------- | ---------- | ---------- |
| `linked_list_cycle.rb` | Linked List Cycle         | Easy       | 141        |
| `happy_number.rb`      | Happy Number              | Easy       | 202        |
| `find_duplicate.rb`    | Find the Duplicate Number | Medium     | 287        |
