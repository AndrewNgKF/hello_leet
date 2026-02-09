# Pattern 20: Bit Manipulation

## Core Idea

Use **bitwise operations** (AND, OR, XOR, NOT, shifts) to solve problems in O(1) space and with fast constant-time tricks.

## Key Operations

| Operation   | Symbol | What It Does       |
| ----------- | ------ | ------------------ |
| AND         | `&`    | Both bits are 1    |
| OR          | `\|`   | Either bit is 1    |
| XOR         | `^`    | Bits are different |
| NOT         | `~`    | Flip all bits      |
| Left shift  | `<<`   | Multiply by 2      |
| Right shift | `>>`   | Divide by 2        |

## Essential Tricks

```ruby
# Check if bit at position i is set
(n >> i) & 1 == 1

# Set bit at position i
n | (1 << i)

# Clear bit at position i
n & ~(1 << i)

# Toggle bit at position i
n ^ (1 << i)

# Check if power of 2
n > 0 && (n & (n - 1)) == 0

# XOR property: a ^ a == 0, a ^ 0 == a
# → Find single number: XOR all elements
nums.reduce(:^)

# Count set bits
n.to_s(2).count('1')  # Ruby way
```

## When to Use

- Finding a **single/unique** element (XOR)
- **Power of 2** checks
- **Counting bits**
- Problems where you need O(1) space and the numbers are bounded

## Complexity

- **Time:** Usually O(n) or O(1) per operation
- **Space:** O(1)

## Problems in This Folder

| File               | Problem       | Difficulty | LeetCode # |
| ------------------ | ------------- | ---------- | ---------- |
| `single_number.rb` | Single Number | Easy       | 136        |
| `counting_bits.rb` | Counting Bits | Easy       | 338        |
| `power_of_two.rb`  | Power of Two  | Easy       | 231        |
