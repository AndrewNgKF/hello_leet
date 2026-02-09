# frozen_string_literal: true

# ============================================================================
# Problem: Reverse Nodes in k-Group (LeetCode #25)
# Link:    https://leetcode.com/problems/reverse-nodes-in-k-group/
# Difficulty: Hard
# Pattern: In-place Linked List Reversal
# ============================================================================
#
# Given the head of a linked list, reverse the nodes of the list k at a
# time, and return the modified list.
#
# k is a positive integer and is less than or equal to the length of the
# linked list. If the number of nodes is not a multiple of k then left-out
# nodes, in the end, should remain as it is.
#
# You may not alter the values in the list's nodes, only nodes themselves
# may be changed.
#
# Example 1:
#   Input:  head = [1,2,3,4,5], k = 2
#   Output: [2,1,4,3,5]
#
# Example 2:
#   Input:  head = [1,2,3,4,5], k = 3
#   Output: [3,2,1,4,5]
#
# Constraints:
#   - 1 <= k <= n <= 5000
#
# Hints:
#   - Count k nodes ahead. If >= k nodes remain, reverse that group.
#   - Use a dummy head to simplify reconnecting groups.
#   - After reversing a group, the original first node becomes the tail of
#     that group — use it to connect to the next group.
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

def reverse_k_group(head, k)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestReverseKGroup < Minitest::Test
  def test_k_2
    assert_equal [2, 1, 4, 3, 5],
                 list_to_array(reverse_k_group(build_list([1, 2, 3, 4, 5]), 2))
  end

  def test_k_3
    assert_equal [3, 2, 1, 4, 5],
                 list_to_array(reverse_k_group(build_list([1, 2, 3, 4, 5]), 3))
  end

  def test_k_1
    assert_equal [1, 2, 3],
                 list_to_array(reverse_k_group(build_list([1, 2, 3]), 1))
  end

  def test_k_equals_length
    assert_equal [3, 2, 1],
                 list_to_array(reverse_k_group(build_list([1, 2, 3]), 3))
  end

  def test_single_node
    assert_equal [1], list_to_array(reverse_k_group(build_list([1]), 1))
  end
end
