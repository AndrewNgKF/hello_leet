# frozen_string_literal: true

# ============================================================================
# Problem: Find Median from Data Stream (LeetCode #295)
# Link:    https://leetcode.com/problems/find-median-from-data-stream/
# Difficulty: Hard
# Pattern: Two Heaps
# ============================================================================
#
# The median is the middle value in an ordered integer list. If the size
# is even, the median is the average of the two middle values.
#
# Implement the MedianFinder class:
#   - MedianFinder.new  — initializes the object
#   - add_num(num)      — adds integer num to the data structure
#   - find_median       — returns the median of all elements so far
#
# Example:
#   mf = MedianFinder.new
#   mf.add_num(1)    # [1]
#   mf.add_num(2)    # [1, 2]
#   mf.find_median    # => 1.5
#   mf.add_num(3)    # [1, 2, 3]
#   mf.find_median    # => 2.0
#
# Constraints:
#   - -10^5 <= num <= 10^5
#   - At most 5 * 10^4 calls total
#   - find_median only called after at least one add_num
#
# Hints:
#   - Use two heaps: a max-heap for the lower half, a min-heap for the
#     upper half of the numbers.
#   - Keep them balanced (sizes differ by at most 1).
#   - Median is from the top of one or the average of both tops.
#   - Ruby doesn't have a built-in heap, so either use a sorted array
#     with bsearch_index + insert, or implement a simple heap.
#
# ============================================================================

class MedianFinder
  def initialize
    # TODO: implement
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

class TestMedianFinder < Minitest::Test
  def test_example
    mf = MedianFinder.new
    mf.add_num(1)
    mf.add_num(2)
    assert_in_delta 1.5, mf.find_median, 0.001
    mf.add_num(3)
    assert_in_delta 2.0, mf.find_median, 0.001
  end

  def test_single
    mf = MedianFinder.new
    mf.add_num(5)
    assert_in_delta 5.0, mf.find_median, 0.001
  end

  def test_descending
    mf = MedianFinder.new
    [5, 4, 3, 2, 1].each { |n| mf.add_num(n) }
    assert_in_delta 3.0, mf.find_median, 0.001
  end

  def test_duplicates
    mf = MedianFinder.new
    [1, 1, 1, 1].each { |n| mf.add_num(n) }
    assert_in_delta 1.0, mf.find_median, 0.001
  end

  def test_negatives
    mf = MedianFinder.new
    [-1, -2, -3, -4].each { |n| mf.add_num(n) }
    assert_in_delta(-2.5, mf.find_median, 0.001)
  end
end
