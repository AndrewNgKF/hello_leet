# frozen_string_literal: true

# ============================================================================
# Problem: Largest Rectangle in Histogram (LeetCode #84)
# Link:    https://leetcode.com/problems/largest-rectangle-in-histogram/
# Difficulty: Hard
# Pattern: Monotonic Stack
# ============================================================================
#
# Given an array of integers `heights` representing the histogram's bar
# heights where the width of each bar is 1, return the area of the largest
# rectangle in the histogram.
#
# Example 1:
#   Input:  heights = [2,1,5,6,2,3]
#   Output: 10
#   Explanation: The rectangle of height 5, spanning indices 2-3, has area 10.
#
# Example 2:
#   Input:  heights = [2,4]
#   Output: 4
#
# Constraints:
#   - 1 <= heights.length <= 10^5
#   - 0 <= heights[i] <= 10^4
#
# Hints:
#   - Use a monotonic increasing stack (store indices).
#   - When you encounter a shorter bar, pop and compute the area for the
#     popped bar as the shortest bar in a range.
#   - Width = current_index - stack.last - 1 (or current_index if stack empty).
#   - Process remaining stack entries at the end.
#
# ============================================================================

def largest_rectangle_area(heights)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestLargestRectangle < Minitest::Test
  def test_example_1
    assert_equal 10, largest_rectangle_area([2, 1, 5, 6, 2, 3])
  end

  def test_example_2
    assert_equal 4, largest_rectangle_area([2, 4])
  end

  def test_single_bar
    assert_equal 5, largest_rectangle_area([5])
  end

  def test_increasing
    assert_equal 6, largest_rectangle_area([1, 2, 3, 4])
  end

  def test_decreasing
    assert_equal 6, largest_rectangle_area([4, 3, 2, 1])
  end

  def test_all_same
    assert_equal 9, largest_rectangle_area([3, 3, 3])
  end
end
