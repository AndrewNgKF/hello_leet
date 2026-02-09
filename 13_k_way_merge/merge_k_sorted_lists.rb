# frozen_string_literal: true

# ============================================================================
# Problem: Merge K Sorted Lists (LeetCode #23)
# Link:    https://leetcode.com/problems/merge-k-sorted-lists/
# Difficulty: Hard
# Pattern: K-way Merge
# ============================================================================
#
# You are given an array of k linked-lists, each sorted in ascending order.
# Merge all the linked-lists into one sorted linked-list and return it.
#
# Example 1:
#   Input:  lists = [[1,4,5],[1,3,4],[2,6]]
#   Output: [1,1,2,3,4,4,5,6]
#
# Example 2:
#   Input:  lists = []
#   Output: []
#
# Constraints:
#   - k == lists.length
#   - 0 <= k <= 10^4
#   - 0 <= lists[i].length <= 500
#   - lists[i] is sorted in ascending order
#
# Hints:
#   - Use a min-heap holding the current head of each list.
#   - Pop the smallest, add its next node back to the heap.
#   - Or merge pairs of lists iteratively (divide and conquer).
#   - Ruby-style: flatten all values, sort, build new list. Simple but
#     O(N log N) instead of O(N log k).
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

def merge_k_lists(lists)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMergeKLists < Minitest::Test
  def test_example
    lists = [[1, 4, 5], [1, 3, 4], [2, 6]].map { |a| build_list(a) }
    assert_equal [1, 1, 2, 3, 4, 4, 5, 6], list_to_array(merge_k_lists(lists))
  end

  def test_empty
    assert_nil merge_k_lists([])
  end

  def test_single_empty_list
    assert_nil merge_k_lists([nil])
  end

  def test_single_list
    assert_equal [1, 2, 3],
                 list_to_array(merge_k_lists([build_list([1, 2, 3])]))
  end

  def test_two_lists
    lists = [[1, 3], [2, 4]].map { |a| build_list(a) }
    assert_equal [1, 2, 3, 4], list_to_array(merge_k_lists(lists))
  end
end
