# Pattern 12: Top K Elements

## Core Idea

Use a **heap** (priority queue) or **quickselect** to efficiently find the K largest, smallest, or most frequent elements without fully sorting.

## When to Use

- "Find the **K largest/smallest**" elements
- "Find the **K most frequent**"
- "**Kth largest/smallest**" element

## Approaches

### 1. Min-Heap of Size K (for K largest)

Maintain a min-heap of size K. The top is always the Kth largest.

### 2. Quickselect (for Kth element)

Partition like quicksort but only recurse into the relevant half. Average O(n).

### 3. Bucket Sort (for frequency-based)

Count frequencies, then bucket by frequency.

```ruby
# Bucket sort approach for Top K Frequent
def top_k_frequent(nums, k)
  count = nums.tally
  buckets = Array.new(nums.length + 1) { [] }

  count.each { |num, freq| buckets[freq] << num }

  buckets.reverse.flatten.first(k)
end
```

## Complexity

- **Heap approach:** O(n log k)
- **Quickselect:** O(n) average, O(n²) worst
- **Bucket sort:** O(n)

## Problems in This Folder

| File                  | Problem                         | Difficulty | LeetCode # |
| --------------------- | ------------------------------- | ---------- | ---------- |
| `kth_largest.rb`      | Kth Largest Element in an Array | Medium     | 215        |
| `top_k_frequent.rb`   | Top K Frequent Elements         | Medium     | 347        |
| `k_closest_points.rb` | K Closest Points to Origin      | Medium     | 973        |
