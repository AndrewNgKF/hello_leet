# Pattern 10: Subsets & Backtracking

## Core Idea

Systematically **explore all possible combinations** by building solutions incrementally and **backtracking** when a path doesn't lead to a valid solution. Think of it as exploring a decision tree.

## When to Use

- Generate all **subsets, permutations, or combinations**
- **Constraint satisfaction** problems (N-Queens, Sudoku)
- Finding **all paths** or **all valid configurations**
- Any "find all..." or "count all..." problem

## Template — Subsets

```ruby
def subsets(nums)
  result = []

  backtrack = ->(start, current) {
    result << current.dup  # add a copy of current subset

    (start...nums.length).each do |i|
      current << nums[i]
      backtrack.call(i + 1, current)
      current.pop  # backtrack!
    end
  }

  backtrack.call(0, [])
  result
end
```

## Template — Permutations

```ruby
def permutations(nums)
  result = []

  backtrack = ->(current, remaining) {
    if remaining.empty?
      result << current.dup
      return
    end

    remaining.each_with_index do |num, i|
      current << num
      backtrack.call(current, remaining[0...i] + remaining[i+1..])
      current.pop
    end
  }

  backtrack.call([], nums)
  result
end
```

## Decision Framework

| Problem Type    | Loop starts at | Can reuse? | Sort needed?  |
| --------------- | -------------- | ---------- | ------------- |
| Subsets         | `start`        | No         | Only if dedup |
| Combinations    | `start`        | No         | Only if dedup |
| Combination Sum | `i` (reuse)    | Yes        | Yes (prune)   |
| Permutations    | `0` (all)      | No         | Only if dedup |

## Complexity

- **Time:** O(2^n) for subsets, O(n!) for permutations
- **Space:** O(n) recursion depth

## Problems in This Folder

| File                 | Problem         | Difficulty | LeetCode # |
| -------------------- | --------------- | ---------- | ---------- |
| `subsets.rb`         | Subsets         | Medium     | 78         |
| `permutations.rb`    | Permutations    | Medium     | 46         |
| `combination_sum.rb` | Combination Sum | Medium     | 39         |
