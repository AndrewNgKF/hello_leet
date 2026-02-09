# Pattern 13: K-way Merge

## Core Idea

Merge **K sorted inputs** (arrays, linked lists, streams) into one sorted output using a **min-heap** to efficiently pick the smallest element across all inputs.

## When to Use

- Merge **K sorted lists/arrays**
- Find the **smallest range** covering elements from K lists
- Problems involving multiple sorted sources

## Template

```ruby
# Conceptual approach (Ruby lacks built-in heap)
def merge_k_sorted(lists)
  # Add first element from each list to a min-heap
  # Pop smallest, add next element from that list
  # Repeat until heap is empty
end
```

## Complexity

- **Time:** O(N log K) where N = total elements, K = number of lists
- **Space:** O(K) for the heap

## Problems in This Folder

| File                            | Problem                                 | Difficulty | LeetCode # |
| ------------------------------- | --------------------------------------- | ---------- | ---------- |
| `merge_k_sorted_lists.rb`       | Merge K Sorted Lists                    | Hard       | 23         |
| `kth_smallest_sorted_matrix.rb` | Kth Smallest Element in a Sorted Matrix | Medium     | 378        |
