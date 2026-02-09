# frozen_string_literal: true

# ============================================================================
# Problem: Linked List Cycle (LeetCode #141)
# Link:    https://leetcode.com/problems/linked-list-cycle/
# Difficulty: Easy
# Pattern: Fast & Slow Pointers
# ============================================================================
#
# Given head, the head of a linked list, determine if the linked list has
# a cycle in it.
#
# There is a cycle if some node's next pointer points back to a previous
# node. Internally, `pos` is used to denote the index of the node that
# tail's next pointer is connected to. Note that `pos` is not passed as
# a parameter.
#
# Return true if there is a cycle, false otherwise.
#
# Example 1:
#   Input:  head = [3,2,0,-4], pos = 1
#   Output: true
#   Explanation: Tail connects to node index 1 (value 2).
#
# Example 2:
#   Input:  head = [1,2], pos = 0
#   Output: true
#
# Example 3:
#   Input:  head = [1], pos = -1
#   Output: false
#
# Constraints:
#   - Number of nodes is in range [0, 10^4]
#   - -10^5 <= Node.val <= 10^5
#   - pos is -1 or a valid index
#
# Hints:
#   - Use fast & slow pointers. Fast moves 2 steps, slow moves 1.
#   - If there's a cycle, they WILL meet. If not, fast reaches nil.
#   - Ruby-style alternative: use a Set to store visited nodes — but that's
#     O(n) space. The pattern way is O(1) space!
#
# ============================================================================

class ListNode
  attr_accessor :val, :next_node

  def initialize(val = 0, next_node = nil)
    @val = val
    @next_node = next_node
  end
end

def build_list(values)
  return nil if values.empty?
  head = ListNode.new(values[0])
  current = head
  values[1..].each do |v|
    current.next_node = ListNode.new(v)
    current = current.next_node
  end
  head
end

def has_cycle?(head)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestLinkedListCycle < Minitest::Test
  def make_cycle(values, pos)
    head = build_list(values)
    return head if pos == -1
    tail = head
    tail = tail.next_node while tail.next_node
    target = head
    pos.times { target = target.next_node }
    tail.next_node = target
    head
  end

  def test_cycle_at_1
    assert has_cycle?(make_cycle([3, 2, 0, -4], 1))
  end

  def test_cycle_at_0
    assert has_cycle?(make_cycle([1, 2], 0))
  end

  def test_no_cycle
    refute has_cycle?(make_cycle([1], -1))
  end

  def test_empty
    refute has_cycle?(nil)
  end

  def test_long_no_cycle
    refute has_cycle?(build_list((1..100).to_a))
  end
end
