# Pattern 11: Modified Binary Search

## Core Idea

Classic binary search finds a target in a sorted array in **O(log n)**. The "modified" version applies binary search to **non-obvious** situations: rotated arrays, search spaces, matrices, and finding boundaries.

## When to Use

- Searching in a **sorted or rotated** array
- Finding a **boundary** (first/last occurrence)
- **Minimizing/maximizing** a value (binary search on answer)
- Searching in a **2D sorted matrix**

## Template — Standard

```ruby
def binary_search(nums, target)
  left, right = 0, nums.length - 1

  while left <= right
    mid = left + (right - left) / 2

    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end

  -1  # not found
end
```

## Template — Find Left Boundary

```ruby
def find_first(nums, target)
  left, right = 0, nums.length - 1
  result = -1

  while left <= right
    mid = left + (right - left) / 2

    if nums[mid] >= target
      result = mid if nums[mid] == target
      right = mid - 1
    else
      left = mid + 1
    end
  end

  result
end
```

## Complexity

- **Time:** O(log n)
- **Space:** O(1)

## Common Mistakes

- Using `(left + right) / 2` — can overflow in other languages (not Ruby, but good habit)
- Wrong boundary update (`left = mid` vs `left = mid + 1` → infinite loop)
- Off-by-one: `left <= right` vs `left < right` depends on the variant

## Problems in This Folder

| File                      | Problem                        | Difficulty | LeetCode # |
| ------------------------- | ------------------------------ | ---------- | ---------- |
| `binary_search.rb`        | Binary Search                  | Easy       | 704        |
| `search_rotated_array.rb` | Search in Rotated Sorted Array | Medium     | 33         |
| `find_peak_element.rb`    | Find Peak Element              | Medium     | 162        |
