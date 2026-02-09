# frozen_string_literal: true

# ============================================================================
# Basics: Singly Linked List
# ============================================================================
#
# A linked list is a chain of nodes where each node holds a value and a
# pointer to the next node. Unlike arrays, linked lists:
#   ✅ O(1) insert/delete at a known position (no shifting)
#   ❌ O(n) random access (no indexing — must traverse)
#
# Visual:
#   head → [1|→] → [2|→] → [3|→] → nil
#
# Each box is a Node: [value | next pointer]
#
# ============================================================================

# ============================================================================
# THE NODE — The building block
# ============================================================================
#
# A node is dead simple: it holds a value and a reference to the next node.

class ListNode
  attr_accessor :val, :next_node

  def initialize(val = 0, next_node = nil)
    @val = val
    @next_node = next_node
  end

  # Pretty print for debugging
  def to_s
    values = []
    current = self
    seen = {}
    while current
      break if seen[current.object_id] # cycle protection
      seen[current.object_id] = true
      values << current.val
      current = current.next_node
    end
    values.join(" → ") + " → nil"
  end
end

# ============================================================================
# BUILDING A LINKED LIST
# ============================================================================
#
# You can build one manually:
#
#   node3 = ListNode.new(3)
#   node2 = ListNode.new(2, node3)
#   node1 = ListNode.new(1, node2)
#   head = node1
#   # head → 1 → 2 → 3 → nil
#
# Or use this helper to build from an array:

def build_list(values)
  return nil if values.empty?

  head = ListNode.new(values[0])
  current = head

  values[1..].each do |val|
    current.next_node = ListNode.new(val)
    current = current.next_node
  end

  head
end

# Convert back to array (useful for testing):
def list_to_array(head)
  result = []
  current = head
  while current
    result << current.val
    current = current.next_node
  end
  result
end

# ============================================================================
# TRAVERSAL — Walking the list
# ============================================================================
#
# The fundamental operation. Start at head, follow next pointers until nil.
#
#   current = head
#   while current
#     puts current.val
#     current = current.next_node
#   end
#
# This is O(n) — you MUST visit each node. There's no shortcut.

# Example: find the length of a linked list
def list_length(head)
  count = 0
  current = head
  while current
    count += 1
    current = current.next_node
  end
  count
end

# Example: search for a value
def list_contains?(head, target)
  current = head
  while current
    return true if current.val == target
    current = current.next_node
  end
  false
end

# ============================================================================
# INSERTION
# ============================================================================
#
# Insert at head — O(1):
#   new_node = ListNode.new(0, head)
#   head = new_node  # don't forget to update head!
#
# Insert at tail — O(n) (must traverse to find the end):
#   current = head
#   current = current.next_node while current.next_node
#   current.next_node = ListNode.new(99)
#
# Insert after a given node — O(1) (if you have the reference):
#   new_node = ListNode.new(5, node.next_node)
#   node.next_node = new_node

# Example: insert at a specific position (0-indexed)
def insert_at(head, position, val)
  new_node = ListNode.new(val)

  # Insert at head
  if position == 0
    new_node.next_node = head
    return new_node
  end

  # Traverse to the node BEFORE the insertion point
  current = head
  (position - 1).times do
    return head unless current # position out of bounds
    current = current.next_node
  end

  return head unless current
  new_node.next_node = current.next_node
  current.next_node = new_node
  head
end

# ============================================================================
# DELETION
# ============================================================================
#
# Delete head — O(1):
#   head = head.next_node
#
# Delete a node after a given node — O(1):
#   node.next_node = node.next_node.next_node
#
# Delete by value — O(n) (must find it first):
#   Use a "previous" pointer, or a dummy head trick.

# Example: delete by value (first occurrence)
def delete_value(head, val)
  # Dummy node trick: avoids special-casing head deletion
  dummy = ListNode.new(0, head)
  prev = dummy
  current = head

  while current
    if current.val == val
      prev.next_node = current.next_node
      break
    end
    prev = current
    current = current.next_node
  end

  dummy.next_node # return the (possibly new) head
end

# ============================================================================
# THE DUMMY NODE TRICK
# ============================================================================
#
# Many linked list problems are easier with a "dummy" (or "sentinel") node
# before the real head. It eliminates edge cases around modifying the head.
#
#   dummy = ListNode.new(0, head)
#   # ... do your work using dummy.next_node as the starting point ...
#   return dummy.next_node  # the real head (may have changed)
#
# You'll see this in: merge sorted lists, remove duplicates, partition list, etc.

# ============================================================================
# YOUR TURN — Challenges
# ============================================================================

# Challenge 1: Return the nth node from the end of the list (1-indexed).
# Example: nth_from_end(1→2→3→4→5, 2) => node with value 4
# Hint: Use two pointers! Advance the first pointer n steps ahead, then
#       move both until the first one hits nil.
def nth_from_end(head, n)
  # TODO: implement — return the VALUE (not the node)
end

# Challenge 2: Detect if a linked list has a cycle.
# A cycle means some node's next pointer leads back to a previous node.
# Hint: Use fast & slow pointers (preview of pattern 3!)
def has_cycle?(head)
  # TODO: implement — return true/false
end

# Challenge 3: Reverse a linked list. Return the new head.
# Example: reverse_list(1→2→3) => 3→2→1
# Hint: Use three pointers: prev, current, next_node
def reverse_list(head)
  # TODO: implement — return the new head
end

# Challenge 4: Merge two sorted linked lists into one sorted list.
# Example: merge_sorted(1→3→5, 2→4→6) => 1→2→3→4→5→6
# Hint: Use the dummy node trick! Compare heads, append smaller.
def merge_sorted(l1, l2)
  # TODO: implement — return the head of the merged list
end

# Challenge 5: Remove all nodes with a given value.
# Example: remove_all(1→2→6→3→6, 6) => 1→2→3
# Hint: Dummy node trick makes this clean.
def remove_all(head, val)
  # TODO: implement — return the head
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestLinkedList < Minitest::Test
  # --- Helper tests (make sure the scaffolding works) ---
  def test_build_and_convert
    head = build_list([1, 2, 3])
    assert_equal [1, 2, 3], list_to_array(head)
  end

  def test_list_length
    assert_equal 4, list_length(build_list([1, 2, 3, 4]))
    assert_equal 0, list_length(nil)
  end

  def test_list_contains
    head = build_list([1, 2, 3])
    assert list_contains?(head, 2)
    refute list_contains?(head, 5)
  end

  def test_insert_at_head
    head = build_list([2, 3])
    head = insert_at(head, 0, 1)
    assert_equal [1, 2, 3], list_to_array(head)
  end

  def test_insert_at_middle
    head = build_list([1, 3])
    head = insert_at(head, 1, 2)
    assert_equal [1, 2, 3], list_to_array(head)
  end

  def test_delete_value
    head = build_list([1, 2, 3])
    head = delete_value(head, 2)
    assert_equal [1, 3], list_to_array(head)
  end

  def test_delete_head
    head = build_list([1, 2, 3])
    head = delete_value(head, 1)
    assert_equal [2, 3], list_to_array(head)
  end

  # --- Your Turn challenges ---
  def test_nth_from_end
    head = build_list([1, 2, 3, 4, 5])
    assert_equal 4, nth_from_end(head, 2)
    assert_equal 5, nth_from_end(head, 1)
    assert_equal 1, nth_from_end(head, 5)
  end

  def test_has_cycle_false
    head = build_list([1, 2, 3])
    refute has_cycle?(head)
  end

  def test_has_cycle_true
    head = build_list([1, 2, 3, 4])
    # Create a cycle: 4 → 2
    current = head
    current = current.next_node while current.next_node
    current.next_node = head.next_node
    assert has_cycle?(head)
  end

  def test_has_cycle_empty
    refute has_cycle?(nil)
  end

  def test_reverse_list
    head = build_list([1, 2, 3, 4])
    head = reverse_list(head)
    assert_equal [4, 3, 2, 1], list_to_array(head)
  end

  def test_reverse_single
    head = build_list([1])
    head = reverse_list(head)
    assert_equal [1], list_to_array(head)
  end

  def test_reverse_empty
    assert_nil reverse_list(nil)
  end

  def test_merge_sorted
    l1 = build_list([1, 3, 5])
    l2 = build_list([2, 4, 6])
    merged = merge_sorted(l1, l2)
    assert_equal [1, 2, 3, 4, 5, 6], list_to_array(merged)
  end

  def test_merge_sorted_empty
    l1 = build_list([1, 2, 3])
    merged = merge_sorted(l1, nil)
    assert_equal [1, 2, 3], list_to_array(merged)
  end

  def test_merge_sorted_uneven
    l1 = build_list([1])
    l2 = build_list([2, 3, 4])
    merged = merge_sorted(l1, l2)
    assert_equal [1, 2, 3, 4], list_to_array(merged)
  end

  def test_remove_all
    head = build_list([1, 2, 6, 3, 6])
    head = remove_all(head, 6)
    assert_equal [1, 2, 3], list_to_array(head)
  end

  def test_remove_all_head
    head = build_list([6, 6, 1, 2])
    head = remove_all(head, 6)
    assert_equal [1, 2], list_to_array(head)
  end

  def test_remove_all_everything
    head = build_list([7, 7, 7])
    head = remove_all(head, 7)
    assert_equal [], list_to_array(head)
  end
end
