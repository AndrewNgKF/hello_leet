# frozen_string_literal: true

# ============================================================================
# Basics: Binary Heap (Min-Heap)
# ============================================================================
#
# A heap is a complete binary tree where every parent is smaller (min-heap)
# or larger (max-heap) than its children.
#
# Ruby has NO built-in heap! You'll need to build one or simulate it.
# This file teaches you to build a min-heap from scratch.
#
# Why you need this:
#   - Top K Elements pattern
#   - Two Heaps pattern
#   - K-way Merge pattern
#   - Priority queues
#
# Visual (min-heap — root is always the minimum):
#         1
#        / \
#       3   5
#      / \
#     7   4
#
# Stored as an array: [1, 3, 5, 7, 4]
#
# Key insight: A heap is stored as an ARRAY, not a tree with pointers!
#   Parent of i:      (i - 1) / 2
#   Left child of i:  2 * i + 1
#   Right child of i: 2 * i + 2
#
# ============================================================================

class MinHeap
  def initialize
    @data = []
  end

  # Add an element — O(log n)
  # 1. Add to the end (maintains complete tree shape)
  # 2. "Bubble up" — swap with parent while smaller than parent
  def push(val)
    @data << val
    bubble_up(@data.length - 1)
  end
  alias << push

  # Remove and return the minimum — O(log n)
  # 1. Swap root with the last element
  # 2. Remove the last element (which is the old root)
  # 3. "Bubble down" — swap root with smaller child while larger than children
  def pop
    return nil if empty?
    return @data.pop if @data.length == 1

    min = @data[0]
    @data[0] = @data.pop # move last to root
    bubble_down(0)
    min
  end

  # See the minimum without removing — O(1)
  def peek
    @data[0]
  end

  def size
    @data.length
  end

  def empty?
    @data.empty?
  end

  def to_a
    @data.dup
  end

  private

  def bubble_up(i)
    while i > 0
      parent = (i - 1) / 2
      break if @data[parent] <= @data[i] # heap property satisfied
      @data[parent], @data[i] = @data[i], @data[parent]
      i = parent
    end
  end

  def bubble_down(i)
    loop do
      smallest = i
      left = 2 * i + 1
      right = 2 * i + 2

      smallest = left if left < @data.length && @data[left] < @data[smallest]
      smallest = right if right < @data.length && @data[right] < @data[smallest]

      break if smallest == i # heap property satisfied
      @data[i], @data[smallest] = @data[smallest], @data[i]
      i = smallest
    end
  end
end

# ============================================================================
# MAX-HEAP TRICK
# ============================================================================
#
# Ruby has no max-heap either. The trick: negate values!
#   Push: heap.push(-val)
#   Pop:  -heap.pop
#   Peek: -heap.peek
#
# Example usage:
#   max_heap = MinHeap.new
#   max_heap.push(-5)   # store -5
#   max_heap.push(-3)   # store -3
#   max_heap.push(-8)   # store -8
#   -max_heap.pop        # => 8 (the maximum!)
#
# ============================================================================

# ============================================================================
# HEAPSORT (bonus)
# ============================================================================
#
# Push everything, then pop everything. O(n log n), but not in-place.

def heapsort(arr)
  heap = MinHeap.new
  arr.each { |val| heap.push(val) }
  result = []
  result << heap.pop until heap.empty?
  result
end

# ============================================================================
# YOUR TURN — Challenges
# ============================================================================

# Challenge 1: Find the kth largest element in an array.
# Example: kth_largest([3, 2, 1, 5, 6, 4], 2) => 5
#
# Hint: Use a min-heap of size k! Push elements in. If the heap exceeds
#       size k, pop the minimum. After processing all elements, the heap's
#       root (minimum of the k largest) is the kth largest.
def kth_largest(nums, k)
  # TODO: implement using MinHeap
end

# Challenge 2: Merge K sorted arrays into one sorted array.
# Example: merge_k_sorted([[1,4,7], [2,5,8], [3,6,9]]) => [1,2,3,4,5,6,7,8,9]
#
# Hint: Push the first element of each array into a min-heap.
#       Pop the smallest, then push the next element from that array.
#       You'll need to track which array and index each element came from.
#       Store [value, array_index, element_index] in the heap.
def merge_k_sorted(arrays)
  # TODO: implement using MinHeap
  # Hint: you'll need to make the heap compare arrays by their first element.
  # Simplest approach: push [value, array_idx, elem_idx] — Ruby compares
  # arrays element-by-element, so it'll sort by value first.
end

# Challenge 3: Find the median of a data stream.
# Implement a class that can:
#   - add_num(num): add a number
#   - find_median: return the current median
#
# Hint: Use TWO heaps! A max-heap for the smaller half, a min-heap for
#       the larger half. Balance them so they differ by at most 1 in size.
class MedianFinder
  def initialize
    # TODO: implement
    # @small = MaxHeap (use negation trick with MinHeap)
    # @large = MinHeap
  end

  def add_num(num)
    # TODO: implement
  end

  def find_median
    # TODO: implement
  end
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMinHeap < Minitest::Test
  def test_basic_operations
    h = MinHeap.new
    h.push(3)
    h.push(1)
    h.push(2)
    assert_equal 1, h.peek
    assert_equal 3, h.size
  end

  def test_pop_order
    h = MinHeap.new
    [5, 3, 8, 1, 2].each { |v| h.push(v) }
    result = []
    result << h.pop until h.empty?
    assert_equal [1, 2, 3, 5, 8], result
  end

  def test_empty_heap
    h = MinHeap.new
    assert h.empty?
    assert_nil h.pop
    assert_nil h.peek
  end

  def test_single_element
    h = MinHeap.new
    h.push(42)
    assert_equal 42, h.pop
    assert h.empty?
  end

  def test_duplicates
    h = MinHeap.new
    [3, 1, 3, 1, 2].each { |v| h.push(v) }
    result = []
    result << h.pop until h.empty?
    assert_equal [1, 1, 2, 3, 3], result
  end

  def test_heapsort
    assert_equal [1, 2, 3, 4, 5], heapsort([5, 3, 1, 4, 2])
    assert_equal [], heapsort([])
    assert_equal [1], heapsort([1])
  end

  def test_max_heap_with_negation
    h = MinHeap.new
    [3, 1, 5, 2].each { |v| h.push(-v) }
    assert_equal 5, -h.pop
    assert_equal 3, -h.pop
  end
end

class TestHeapChallenges < Minitest::Test
  def test_kth_largest
    assert_equal 5, kth_largest([3, 2, 1, 5, 6, 4], 2)
    assert_equal 4, kth_largest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
    assert_equal 1, kth_largest([1], 1)
  end

  def test_merge_k_sorted
    result = merge_k_sorted([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], result
  end

  def test_merge_k_sorted_empty
    assert_equal [1, 2, 3], merge_k_sorted([[1, 2, 3]])
    assert_equal [], merge_k_sorted([])
  end

  def test_merge_k_sorted_uneven
    result = merge_k_sorted([[1, 3], [2], [4, 5, 6]])
    assert_equal [1, 2, 3, 4, 5, 6], result
  end

  def test_median_finder
    mf = MedianFinder.new
    mf.add_num(1)
    assert_equal 1.0, mf.find_median
    mf.add_num(2)
    assert_equal 1.5, mf.find_median
    mf.add_num(3)
    assert_equal 2.0, mf.find_median
  end

  def test_median_finder_descending
    mf = MedianFinder.new
    mf.add_num(5)
    mf.add_num(4)
    mf.add_num(3)
    mf.add_num(2)
    mf.add_num(1)
    assert_equal 3.0, mf.find_median
  end
end
