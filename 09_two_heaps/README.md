# Pattern 9: Two Heaps

## Core Idea

Use a **max-heap** for the smaller half and a **min-heap** for the larger half to efficiently track the **median** or partition elements dynamically.

## When to Use

- Finding the **median** of a data stream
- Splitting data into two halves where you need the **boundary elements**
- **Sliding window median**

## Template

```ruby
# Ruby doesn't have a built-in heap, so you'd use a sorted structure
# or implement a simple heap. Conceptually:

# max_heap: stores smaller half (negate values to simulate max-heap with min-heap)
# min_heap: stores larger half

# Balance rule: max_heap can have at most 1 more element than min_heap
# Invariant: all elements in max_heap <= all elements in min_heap
```

## Note on Ruby

Ruby lacks a built-in priority queue/heap. Options:

1. Use a sorted array (simpler but O(n) insert)
2. Implement a binary heap class
3. For practice purposes, the sorted array approach is fine

## Complexity

- **Time:** O(log n) per insert, O(1) for median
- **Space:** O(n)

## Problems in This Folder

| File                       | Problem                      | Difficulty | LeetCode # |
| -------------------------- | ---------------------------- | ---------- | ---------- |
| `find_median.rb`           | Find Median from Data Stream | Hard       | 295        |
| `sliding_window_median.rb` | Sliding Window Median        | Hard       | 480        |
