# frozen_string_literal: true

# ============================================================================
# Basics: Stacks & Queues
# ============================================================================
#
# Two fundamental data structures defined by their access pattern:
#
#   Stack (LIFO — Last In, First Out)
#   Think: stack of plates. You add and remove from the TOP.
#   ┌───┐
#   │ 3 │ ← top (push/pop here)
#   │ 2 │
#   │ 1 │
#   └───┘
#
#   Queue (FIFO — First In, First Out)
#   Think: line at a store. First person in line gets served first.
#   front → [1] [2] [3] ← back (enqueue here)
#            ↑
#         dequeue here
#
# ============================================================================

# ============================================================================
# STACK in Ruby
# ============================================================================
#
# Ruby arrays already work as stacks:
#   push  → array.push(val)  or  array << val
#   pop   → array.pop
#   peek  → array.last
#   empty → array.empty?
#
# All O(1) operations!
#
# When to use a stack:
#   - Matching parentheses/brackets
#   - Undo operations
#   - DFS (iterative)
#   - Expression evaluation
#   - Monotonic stack pattern
#   - Backtracking (implicit in recursion — the call stack IS a stack!)

# Example: Valid Parentheses (LeetCode #20 preview)
# Given a string containing '(', ')', '{', '}', '[', ']', determine if valid.
def valid_parentheses?(s)
  stack = []
  matching = { ")" => "(", "}" => "{", "]" => "[" }

  s.each_char do |ch|
    if matching.values.include?(ch) # opening bracket
      stack.push(ch)
    elsif matching.key?(ch) # closing bracket
      return false if stack.empty? || stack.pop != matching[ch]
    end
  end

  stack.empty?
end

# ============================================================================
# QUEUE in Ruby
# ============================================================================
#
# Ruby arrays can work as queues, but shift is O(n)!
#   enqueue → array.push(val)
#   dequeue → array.shift        ← O(n) because it repositions all elements!
#   peek    → array.first
#
# For LeetCode this is fine. For production code, use a proper queue.
#
# When to use a queue:
#   - BFS traversal (trees and graphs)
#   - Level-order processing
#   - Scheduling / ordering
#   - Sliding window (using a deque)
#
# ============================================================================

# Example: Generate binary numbers from 1 to N using a queue
# generate_binary(5) => ["1", "10", "11", "100", "101"]
def generate_binary(n)
  result = []
  queue = ["1"]

  n.times do
    front = queue.shift
    result << front
    queue.push(front + "0")
    queue.push(front + "1")
  end

  result
end

# ============================================================================
# DEQUE (Double-Ended Queue)
# ============================================================================
#
# A deque allows push/pop from BOTH ends. Ruby arrays support this:
#   push_back  → array.push(val)
#   push_front → array.unshift(val)   ← O(n) in Ruby arrays
#   pop_back   → array.pop
#   pop_front  → array.shift          ← O(n) in Ruby arrays
#
# Used in: Sliding Window Maximum (using a monotonic deque)
#
# For interview purposes, the O(n) shift/unshift is acceptable.
# ============================================================================

# ============================================================================
# STACK vs QUEUE: When to use which?
# ============================================================================
#
# Ask yourself: "Do I need the most RECENT thing, or the OLDEST thing?"
#
#   Most recent → Stack (LIFO)
#     - Matching brackets: most recent open bracket
#     - DFS: explore the most recent path
#     - Undo: undo the most recent action
#
#   Oldest first → Queue (FIFO)
#     - BFS: process nodes in discovery order
#     - Level-order: process level by level
#     - Task scheduling: first come, first served
#
# ============================================================================

# ============================================================================
# YOUR TURN — Challenges
# ============================================================================

# Challenge 1: Implement a MinStack that supports push, pop, top, and
# retrieving the minimum element — all in O(1) time.
#
# Hint: Use two stacks! The main stack for values, and an auxiliary stack
#       that tracks the current minimum at each level.
#
# Example:
#   s = MinStack.new
#   s.push(-2); s.push(0); s.push(-3)
#   s.get_min  # => -3
#   s.pop
#   s.top      # => 0
#   s.get_min  # => -2
class MinStack
  def initialize
    # TODO: implement
  end

  def push(val)
    # TODO: implement
  end

  def pop
    # TODO: implement
  end

  def top
    # TODO: implement
  end

  def get_min
    # TODO: implement
  end
end

# Challenge 2: Implement a queue using two stacks.
# A stack only gives you LIFO. Can you get FIFO behavior with two stacks?
#
# Hint: Use an "inbox" stack and an "outbox" stack. Push goes to inbox.
#       When you need to dequeue, if outbox is empty, pour inbox into outbox.
class QueueWithStacks
  def initialize
    # TODO: implement
  end

  def enqueue(val)
    # TODO: implement
  end

  def dequeue
    # TODO: implement
  end

  def peek
    # TODO: implement
  end

  def empty?
    # TODO: implement
  end
end

# Challenge 3: Evaluate a Reverse Polish Notation (RPN) expression.
# Tokens are numbers or operators (+, -, *, /).
# Example: eval_rpn(["2", "1", "+", "3", "*"]) => 9
#          Explanation: ((2 + 1) * 3) = 9
# Example: eval_rpn(["4", "13", "5", "/", "+"]) => 6
#          Explanation: (4 + (13 / 5)) = 6  (integer division)
#
# Hint: Push numbers onto a stack. When you see an operator, pop two
#       numbers, apply the operator, push the result back.
def eval_rpn(tokens)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestStacksAndQueues < Minitest::Test
  # --- Provided examples ---
  def test_valid_parentheses
    assert valid_parentheses?("()[]{}")
    assert valid_parentheses?("{[]}")
    refute valid_parentheses?("(]")
    refute valid_parentheses?("([)]")
    assert valid_parentheses?("")
  end

  def test_generate_binary
    assert_equal %w[1 10 11 100 101], generate_binary(5)
    assert_equal ["1"], generate_binary(1)
  end

  # --- MinStack ---
  def test_min_stack
    s = MinStack.new
    s.push(-2)
    s.push(0)
    s.push(-3)
    assert_equal(-3, s.get_min)
    s.pop
    assert_equal 0, s.top
    assert_equal(-2, s.get_min)
  end

  def test_min_stack_all_same
    s = MinStack.new
    s.push(1)
    s.push(1)
    s.push(1)
    assert_equal 1, s.get_min
    s.pop
    assert_equal 1, s.get_min
  end

  def test_min_stack_ascending
    s = MinStack.new
    s.push(1)
    s.push(2)
    s.push(3)
    assert_equal 1, s.get_min
    s.pop
    assert_equal 1, s.get_min
  end

  # --- Queue with Stacks ---
  def test_queue_with_stacks
    q = QueueWithStacks.new
    assert q.empty?
    q.enqueue(1)
    q.enqueue(2)
    q.enqueue(3)
    refute q.empty?
    assert_equal 1, q.peek
    assert_equal 1, q.dequeue
    assert_equal 2, q.dequeue
    q.enqueue(4)
    assert_equal 3, q.dequeue
    assert_equal 4, q.dequeue
    assert q.empty?
  end

  # --- Reverse Polish Notation ---
  def test_rpn_basic
    assert_equal 9, eval_rpn(%w[2 1 + 3 *])
  end

  def test_rpn_division
    assert_equal 6, eval_rpn(%w[4 13 5 / +])
  end

  def test_rpn_complex
    assert_equal 22, eval_rpn(%w[10 6 9 3 + -11 * / * 17 + 5 +])
  end

  def test_rpn_single_number
    assert_equal 42, eval_rpn(["42"])
  end
end
