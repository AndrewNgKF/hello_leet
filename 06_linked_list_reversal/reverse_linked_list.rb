# frozen_string_literal: true

# ============================================================================
# Problem: Reverse Linked List (LeetCode #206)
# Link:    https://leetcode.com/problems/reverse-linked-list/
# Difficulty: Easy
# Pattern: In-place Linked List Reversal
# ============================================================================
#
# Given the head of a singly linked list, reverse the list, and return
# the reversed list.
#
# Example 1:
#   Input:  head = [1,2,3,4,5]
#   Output: [5,4,3,2,1]
#
# Example 2:
#   Input:  head = [1,2]
#   Output: [2,1]
#
# Example 3:
#   Input:  head = []
#   Output: []
#
# Constraints:
#   - Number of nodes is in range [0, 5000]
#   - -5000 <= Node.val <= 5000
#
# Hints:
#   - Use three pointers: prev, curr, next_node.
#   - At each step: save next, point curr.next to prev, advance both.
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

def list_to_array(head)
  result = []
  current = head
  while current
    result << current.val
    current = current.next_node
  end
  result
end

def reverse_list(head)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestReverseLinkedList < Minitest::Test
  def test_five_nodes
    assert_equal [5, 4, 3, 2, 1],
                 list_to_array(reverse_list(build_list([1, 2, 3, 4, 5])))
  end

  def test_two_nodes
    assert_equal [2, 1], list_to_array(reverse_list(build_list([1, 2])))
  end

  def test_empty
    assert_nil reverse_list(nil)
  end

  def test_single
    assert_equal [1], list_to_array(reverse_list(build_list([1])))
  end
end
