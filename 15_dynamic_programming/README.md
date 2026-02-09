# Pattern 15: Dynamic Programming

## Core Idea

Break a problem into **overlapping subproblems** with **optimal substructure**. Solve each subproblem once, store the result, and build up to the full solution.

## When to Use

- "Find the **minimum/maximum** cost/path/sum"
- "**How many ways** to reach...?"
- "Is it **possible** to...?"
- "Find the **longest/shortest** subsequence/substring"

## The Two Approaches

### 1. Top-Down (Memoization)

Recursive with caching. More intuitive.

```ruby
def fib(n, memo = {})
  return n if n <= 1
  memo[n] ||= fib(n - 1, memo) + fib(n - 2, memo)
end
```

### 2. Bottom-Up (Tabulation)

Iterative, filling a table from base cases up. Often more efficient.

```ruby
def fib(n)
  return n if n <= 1
  dp = [0, 1]
  (2..n).each { |i| dp[i] = dp[i-1] + dp[i-2] }
  dp[n]
end
```

## DP Categories

| Category        | Examples                                                |
| --------------- | ------------------------------------------------------- |
| **1D DP**       | Climbing Stairs, House Robber, Coin Change              |
| **2D DP**       | Longest Common Subsequence, Edit Distance, Unique Paths |
| **Knapsack**    | 0/1 Knapsack, Partition Equal Subset Sum                |
| **String DP**   | Palindromic Substrings, Word Break                      |
| **Interval DP** | Burst Balloons, Matrix Chain Multiplication             |

## Framework

1. **Define state:** What does `dp[i]` (or `dp[i][j]`) represent?
2. **Recurrence:** How does `dp[i]` relate to smaller subproblems?
3. **Base case:** What's the starting value?
4. **Order:** Fill the table in the right direction
5. **Answer:** Where is the final answer in the table?

## Complexity

- Varies per problem. Usually **O(n)** to **O(n²)** time, **O(n)** space (often optimizable).

## Problems in This Folder

| File                            | Problem                    | Difficulty | LeetCode # |
| ------------------------------- | -------------------------- | ---------- | ---------- |
| `climbing_stairs.rb`            | Climbing Stairs            | Easy       | 70         |
| `coin_change.rb`                | Coin Change                | Medium     | 322        |
| `longest_common_subsequence.rb` | Longest Common Subsequence | Medium     | 1143       |
