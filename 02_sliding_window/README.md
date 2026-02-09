# Pattern 2: Sliding Window

## Core Idea

Maintain a **window** (subarray/substring) that slides over the data. Instead of recalculating from scratch each time, **add the new element and remove the old one** — turning O(n×k) into O(n).

## When to Use

- Finding **subarrays/substrings** with a given property
- Problems with "**contiguous**" elements
- "Longest/shortest/maximum/minimum" subarray questions
- Problems involving a "window of size k"

## The Two Variants

### 1. Fixed-Size Window

Window size is given. Slide it one step at a time.

```ruby
# Window of size k
window_sum = nums[0...k].sum
max_sum = window_sum

(k...nums.length).each do |i|
  window_sum += nums[i] - nums[i - k]  # add right, remove left
  max_sum = [max_sum, window_sum].max
end
```

### 2. Dynamic-Size Window (Expand/Shrink)

Expand the right boundary, shrink the left when constraint is violated.

```ruby
left = 0
(0...s.length).each do |right|
  # expand: add s[right] to window state

  while window_is_invalid
    # shrink: remove s[left] from window state
    left += 1
  end

  # update best answer
end
```

**Use for:** Longest Substring Without Repeating Characters, Minimum Window Substring

## Complexity

- **Time:** O(n) — each element is added/removed at most once
- **Space:** O(k) or O(alphabet size) for the window state (usually a hash)

## Common Mistakes

- Forgetting to **shrink** the window (infinite loop or wrong answer)
- Using the wrong **window state** (hash vs counter vs sum)
- Off-by-one on window **size calculation** (`right - left + 1`)

## Problems in This Folder

| File                             | Problem                                        | Difficulty | LeetCode # |
| -------------------------------- | ---------------------------------------------- | ---------- | ---------- |
| `max_subarray_sum_k.rb`          | Maximum Sum Subarray of Size K                 | Easy       | —          |
| `longest_substring_no_repeat.rb` | Longest Substring Without Repeating Characters | Medium     | 3          |
| `minimum_window_substring.rb`    | Minimum Window Substring                       | Hard       | 76         |
