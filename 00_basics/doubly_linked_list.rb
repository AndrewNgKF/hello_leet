# frozen_string_literal: true

# ============================================================================
# Basics: Doubly Linked List
# ============================================================================
#
# A doubly linked list is like a singly linked list, but each node also has
# a pointer to the PREVIOUS node. This lets you traverse in both directions.
#
# Visual:
#   nil ← [1|←→] ↔ [2|←→] ↔ [3|←→] → nil
#
# Trade-offs vs singly linked list:
#   ✅ Can traverse backwards
#   ✅ O(1) delete if you have the node reference (no need to find prev)
#   ❌ More memory per node (extra pointer)
#   ❌ More pointers to maintain on insert/delete
#
# Where you'll see it:
#   - LRU Cache (LeetCode #146) — the classic doubly linked list problem
#   - Browser back/forward navigation
#   - Deques (double-ended queues)
#
# ============================================================================

class DListNode
  attr_accessor :val, :prev_node, :next_node

  def initialize(val = 0, prev_node = nil, next_node = nil)
    @val = val
    @prev_node = prev_node
    @next_node = next_node
  end
end

# ============================================================================
# DOUBLY LINKED LIST — with sentinel head and tail nodes
# ============================================================================
#
# Using dummy head & tail nodes eliminates all edge cases:
#
#   dummy_head ↔ [real nodes] ↔ dummy_tail
#
# You never insert/delete the dummies — they're just anchors.

class DoublyLinkedList
  attr_reader :size

  def initialize
    @head = DListNode.new(:head) # dummy head
    @tail = DListNode.new(:tail) # dummy tail
    @head.next_node = @tail
    @tail.prev_node = @head
    @size = 0
  end

  # Add to the front (after dummy head) — O(1)
  def push_front(val)
    node = DListNode.new(val)
    insert_after(@head, node)
    node
  end

  # Add to the back (before dummy tail) — O(1)
  def push_back(val)
    node = DListNode.new(val)
    insert_before(@tail, node)
    node
  end

  # Remove from the front — O(1)
  def pop_front
    return nil if empty?
    node = @head.next_node
    remove_node(node)
    node.val
  end

  # Remove from the back — O(1)
  def pop_back
    return nil if empty?
    node = @tail.prev_node
    remove_node(node)
    node.val
  end

  # Remove a specific node — O(1) if you have the reference!
  # This is the superpower of doubly linked lists.
  def remove_node(node)
    node.prev_node.next_node = node.next_node
    node.next_node.prev_node = node.prev_node
    @size -= 1
    node
  end

  # Move an existing node to the front — O(1)
  # Used in LRU Cache to mark something as "recently used"
  def move_to_front(node)
    remove_node(node)
    insert_after(@head, node)
  end

  def empty?
    @size == 0
  end

  # Peek at front/back values
  def front
    return nil if empty?
    @head.next_node.val
  end

  def back
    return nil if empty?
    @tail.prev_node.val
  end

  # Convert to array (forward) for debugging/testing
  def to_a
    result = []
    current = @head.next_node
    while current != @tail
      result << current.val
      current = current.next_node
    end
    result
  end

  # Convert to array (backward)
  def to_a_reverse
    result = []
    current = @tail.prev_node
    while current != @head
      result << current.val
      current = current.prev_node
    end
    result
  end

  private

  def insert_after(node, new_node)
    new_node.prev_node = node
    new_node.next_node = node.next_node
    node.next_node.prev_node = new_node
    node.next_node = new_node
    @size += 1
  end

  def insert_before(node, new_node)
    insert_after(node.prev_node, new_node)
  end
end

# ============================================================================
# YOUR TURN — Challenges
# ============================================================================

# Challenge 1: Implement a simple LRU Cache
# An LRU (Least Recently Used) Cache has a fixed capacity. When full and a
# new item is added, the least recently used item is evicted.
#
# Operations:
#   get(key)       — returns value if key exists (and marks it as recently used),
#                    or -1 if not found
#   put(key, value) — adds/updates the key-value pair. If at capacity, evict
#                     the least recently used item first.
#
# Example:
#   cache = LRUCache.new(2)    # capacity 2
#   cache.put(1, 1)            # cache: {1=1}
#   cache.put(2, 2)            # cache: {1=1, 2=2}
#   cache.get(1)               # => 1, cache: {2=2, 1=1}
#   cache.put(3, 3)            # evict key 2, cache: {1=1, 3=3}
#   cache.get(2)               # => -1 (not found)
#
# Hint: Use a Hash for O(1) key lookup + DoublyLinkedList for O(1) eviction.
#       Most recently used at front, least at back.

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    # TODO: initialize your data structures
  end

  def get(key)
    # TODO: implement
    -1
  end

  def put(key, value)
    # TODO: implement
  end
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestDoublyLinkedList < Minitest::Test
  def test_push_front_and_back
    dll = DoublyLinkedList.new
    dll.push_front(2)
    dll.push_front(1)
    dll.push_back(3)
    assert_equal [1, 2, 3], dll.to_a
  end

  def test_reverse_traversal
    dll = DoublyLinkedList.new
    [1, 2, 3].each { |v| dll.push_back(v) }
    assert_equal [3, 2, 1], dll.to_a_reverse
  end

  def test_pop_front_and_back
    dll = DoublyLinkedList.new
    [1, 2, 3].each { |v| dll.push_back(v) }
    assert_equal 1, dll.pop_front
    assert_equal 3, dll.pop_back
    assert_equal [2], dll.to_a
  end

  def test_remove_node
    dll = DoublyLinkedList.new
    dll.push_back(1)
    middle = dll.push_back(2)
    dll.push_back(3)
    dll.remove_node(middle)
    assert_equal [1, 3], dll.to_a
    assert_equal 2, dll.size
  end

  def test_move_to_front
    dll = DoublyLinkedList.new
    dll.push_back(1)
    dll.push_back(2)
    node3 = dll.push_back(3)
    dll.move_to_front(node3)
    assert_equal [3, 1, 2], dll.to_a
  end

  def test_empty_operations
    dll = DoublyLinkedList.new
    assert dll.empty?
    assert_nil dll.pop_front
    assert_nil dll.pop_back
    assert_nil dll.front
    assert_nil dll.back
  end

  def test_size_tracking
    dll = DoublyLinkedList.new
    assert_equal 0, dll.size
    dll.push_back(1)
    dll.push_back(2)
    assert_equal 2, dll.size
    dll.pop_front
    assert_equal 1, dll.size
  end
end

class TestLRUCache < Minitest::Test
  def test_basic_operations
    cache = LRUCache.new(2)
    cache.put(1, 1)
    cache.put(2, 2)
    assert_equal 1, cache.get(1)
  end

  def test_eviction
    cache = LRUCache.new(2)
    cache.put(1, 1)
    cache.put(2, 2)
    cache.get(1) # makes key 1 recently used
    cache.put(3, 3) # evicts key 2 (least recently used)
    assert_equal(-1, cache.get(2)) # should be evicted
    assert_equal 3, cache.get(3)
  end

  def test_update_value
    cache = LRUCache.new(2)
    cache.put(1, 1)
    cache.put(1, 10) # update value for key 1
    assert_equal 10, cache.get(1)
  end

  def test_miss
    cache = LRUCache.new(1)
    assert_equal(-1, cache.get(99))
  end

  def test_capacity_one
    cache = LRUCache.new(1)
    cache.put(1, 1)
    cache.put(2, 2) # evicts key 1
    assert_equal(-1, cache.get(1))
    assert_equal 2, cache.get(2)
  end

  def test_eviction_order
    cache = LRUCache.new(3)
    cache.put(1, 1)
    cache.put(2, 2)
    cache.put(3, 3)
    cache.get(1) # access order: 2, 3, 1
    cache.get(3) # access order: 2, 1, 3
    cache.put(4, 4) # evicts key 2 (least recently used)
    assert_equal(-1, cache.get(2))
    assert_equal 1, cache.get(1)
    assert_equal 3, cache.get(3)
    assert_equal 4, cache.get(4)
  end
end
