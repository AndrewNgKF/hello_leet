# Pattern 17: Monotonic Stack

## Core Idea

Maintain a stack where elements are always in **increasing or decreasing order**. When a new element violates the order, pop elements — those popped elements have found their "answer" (next greater, next smaller, etc.).

## When to Use

- **Next Greater Element** / Next Smaller Element
- **Previous Greater/Smaller**
- **Largest Rectangle** in Histogram
- Problems asking about the nearest element satisfying a condition

## Template — Next Greater Element

```ruby
def next_greater(nums)
  result = Array.new(nums.length, -1)
  stack = []  # stores indices

  nums.each_with_index do |num, i|
    while !stack.empty? && nums[stack.last] < num
      result[stack.pop] = num
    end
    stack << i
  end

  result
end
```

## Complexity

- **Time:** O(n) — each element is pushed and popped at most once
- **Space:** O(n)

## Problems in This Folder

| File                      | Problem                        | Difficulty | LeetCode # |
| ------------------------- | ------------------------------ | ---------- | ---------- |
| `next_greater_element.rb` | Next Greater Element I         | Easy       | 496        |
| `daily_temperatures.rb`   | Daily Temperatures             | Medium     | 739        |
| `largest_rectangle.rb`    | Largest Rectangle in Histogram | Hard       | 84         |
