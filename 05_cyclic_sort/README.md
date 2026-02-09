# Pattern 5: Cyclic Sort

## Core Idea

When you're given an array containing numbers in a **known range** (e.g., 1 to n), place each number at its correct index. The numbers that end up in the wrong spot reveal the answer (missing, duplicate, etc.).

## When to Use

- Array contains numbers in range **[0, n]** or **[1, n]**
- Finding **missing** or **duplicate** numbers
- You need **O(n) time with O(1) space**

## Template

```ruby
i = 0
while i < nums.length
  correct = nums[i] - 1  # where this number should be (for 1..n)
  if nums[i] != nums[correct]
    nums[i], nums[correct] = nums[correct], nums[i]  # swap to correct position
  else
    i += 1
  end
end

# Now scan for mismatches
```

## Complexity

- **Time:** O(n) — each number is swapped at most once
- **Space:** O(1)

## Problems in This Folder

| File                        | Problem                         | Difficulty | LeetCode # |
| --------------------------- | ------------------------------- | ---------- | ---------- |
| `missing_number.rb`         | Missing Number                  | Easy       | 268        |
| `find_all_duplicates.rb`    | Find All Duplicates in an Array | Medium     | 442        |
| `first_missing_positive.rb` | First Missing Positive          | Hard       | 41         |
