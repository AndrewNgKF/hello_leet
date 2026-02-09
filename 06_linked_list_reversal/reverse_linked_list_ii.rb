# frozen_string_literal: true

# ============================================================================
# Problem: Reverse Linked List II (LeetCode #92)
# Link:    https://leetcode.com/problems/reverse-linked-list-ii/
# Difficulty: Medium
# Pattern: In-place Linked List Reversal
# ============================================================================
#
# Given the head of a singly linked list and two integers `left` and `right`
# where left <= right, reverse the nodes of the list from position left to
# position right, and return the reversed list.
#
# (Positions are 1-indexed.)
#
# Example 1:
#   Input:  head = [1,2,3,4,5], left = 2, right = 4
#   Output: [1,4,3,2,5]
#
# Example 2:
#   Input:  head = [5], left = 1, right = 1
#   Output: [5]
#
# Constraints:
#   - 1 <= left <= right <= n
#   - 1 <= n <= 500
#
# Hints:
#   - Use a dummy node to handle the case where left = 1.
#   - Traverse to the node just before position left.
#   - Reverse (right - left) times using the classic reversal technique.
#   - Reconnect the reversed segment with the rest of the list.
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

def reverse_between(head, left, right)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestReverseBetween < Minitest::Test
  def test_middle_section
    assert_equal [1, 4, 3, 2, 5],
                 list_to_array(
                   reverse_between(build_list([1, 2, 3, 4, 5]), 2, 4)
                 )
  end

  def test_single_node
    assert_equal [5], list_to_array(reverse_between(build_list([5]), 1, 1))
  end

  def test_entire_list
    assert_equal [5, 4, 3, 2, 1],
                 list_to_array(
                   reverse_between(build_list([1, 2, 3, 4, 5]), 1, 5)
                 )
  end

  def test_first_two
    assert_equal [2, 1, 3, 4],
                 list_to_array(reverse_between(build_list([1, 2, 3, 4]), 1, 2))
  end

  def test_last_two
    assert_equal [1, 2, 4, 3],
                 list_to_array(reverse_between(build_list([1, 2, 3, 4]), 3, 4))
  end
end
