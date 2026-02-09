# Pattern 16: Greedy

## Core Idea

Make the **locally optimal choice** at each step, hoping it leads to the **globally optimal** solution. Greedy works when the problem has the **greedy choice property** — a local optimum leads to a global optimum.

## When to Use

- Scheduling/interval problems
- Problems where **sorting + one pass** gives the answer
- When you can prove that the greedy choice is always safe

## How to Recognize

- Often involves **sorting** by some criteria first
- "Minimum number of..." or "Maximum number of..."
- The problem has an intuitive "take the best available" strategy

## Template

```ruby
# Generic greedy structure
def greedy_solve(items)
  items.sort_by! { |item| some_criteria(item) }
  result = initial_value

  items.each do |item|
    if can_take?(item)
      result = update(result, item)
    end
  end

  result
end
```

## Complexity

- Usually **O(n log n)** due to sorting, then **O(n)** for the pass

## Greedy vs DP

If you're not sure whether greedy works, try to find a **counterexample**. If you can't, greedy probably works. If you can, use DP.

## Problems in This Folder

| File                | Problem        | Difficulty | LeetCode # |
| ------------------- | -------------- | ---------- | ---------- |
| `jump_game.rb`      | Jump Game      | Medium     | 55         |
| `task_scheduler.rb` | Task Scheduler | Medium     | 621        |
| `gas_station.rb`    | Gas Station    | Medium     | 134        |
