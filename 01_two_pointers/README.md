# Pattern 1: Two Pointers

## Core Idea

Use **two pointers** (indices or references) that move through a data structure — typically an array or linked list — to solve problems efficiently in **O(n)** time instead of the brute-force **O(n²)**.

## When to Use

- The input is **sorted** (or can be sorted)
- You need to find **pairs or triplets** that satisfy a condition
- You need to compare elements from **both ends** of an array
- You're partitioning data **in-place**

## The Three Variants

### 1. Opposite Direction (Converging)

Pointers start at both ends and move toward each other.

```ruby
left, right = 0, nums.length - 1
while left < right
  # check condition, move left++ or right--
end
```

**Use for:** Two Sum (sorted), Container With Most Water, Valid Palindrome

### 2. Same Direction (Fast/Slow or Read/Write)

Both pointers start at the beginning; one moves faster or conditionally.

```ruby
slow = 0
(0...nums.length).each do |fast|
  if condition(nums[fast])
    nums[slow] = nums[fast]
    slow += 1
  end
end
```

**Use for:** Remove Duplicates, Move Zeroes, Remove Element

### 3. Three Pointers

Extension of two pointers — anchor one, sweep with the other two.

```ruby
nums.sort!
(0...nums.length - 2).each do |i|
  left, right = i + 1, nums.length - 1
  while left < right
    # standard two-pointer logic
  end
end
```

**Use for:** 3Sum, 3Sum Closest

## Complexity

- **Time:** O(n) for one pass, O(n²) for nested (e.g., 3Sum with sorting)
- **Space:** O(1) — in-place

## Common Mistakes

- Forgetting to **sort first** when the problem requires sorted input
- Off-by-one errors on **when to stop** (`left < right` vs `left <= right`)
- Not handling **duplicates** (skip same values to avoid duplicate results)

## Problems in This Folder

| File                           | Problem                            | Difficulty | LeetCode # |
| ------------------------------ | ---------------------------------- | ---------- | ---------- |
| `two_sum_ii.rb`                | Two Sum II - Input Array Is Sorted | Easy       | 167        |
| `three_sum.rb`                 | 3Sum                               | Medium     | 15         |
| `container_with_most_water.rb` | Container With Most Water          | Medium     | 11         |
