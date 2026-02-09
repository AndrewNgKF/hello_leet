# frozen_string_literal: true

# ============================================================================
# Problem: Kth Smallest Element in a Sorted Matrix (LeetCode #378)
# Link:    https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/
# Difficulty: Medium
# Pattern: K-way Merge
# ============================================================================
#
# Given an n x n matrix where each row and column is sorted in ascending
# order, return the kth smallest element in the matrix.
#
# Example 1:
#   Input:  matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
#   Output: 13
#   Explanation: Sorted: [1,5,9,10,11,12,13,13,15], 8th = 13.
#
# Example 2:
#   Input:  matrix = [[-5]], k = 1
#   Output: -5
#
# Constraints:
#   - n == matrix.length == matrix[i].length
#   - 1 <= n <= 300
#   - 1 <= k <= n²
#
# Hints:
#   - K-way merge: treat each row as a sorted list, use a min-heap.
#   - Or binary search on the value range [matrix[0][0]..matrix[-1][-1]],
#     counting how many elements are <= mid.
#   - Ruby-style: matrix.flatten.sort[k-1] — O(n² log n²) but simple.
#
# ============================================================================

def kth_smallest(matrix, k)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestKthSmallest < Minitest::Test
  def test_example_1
    assert_equal 13, kth_smallest([[1, 5, 9], [10, 11, 13], [12, 13, 15]], 8)
  end

  def test_single
    assert_equal(-5, kth_smallest([[-5]], 1))
  end

  def test_first_element
    assert_equal 1, kth_smallest([[1, 5, 9], [10, 11, 13], [12, 13, 15]], 1)
  end

  def test_last_element
    assert_equal 15, kth_smallest([[1, 5, 9], [10, 11, 13], [12, 13, 15]], 9)
  end

  def test_2x2
    assert_equal 3, kth_smallest([[1, 2], [3, 4]], 3)
  end
end
