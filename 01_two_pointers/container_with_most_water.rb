# frozen_string_literal: true

# ============================================================================
# Problem: Container With Most Water (LeetCode #11)
# Link:    https://leetcode.com/problems/container-with-most-water/
# Difficulty: Medium
# Pattern: Two Pointers (Converging)
# ============================================================================
#
# You are given an integer array `height` of length n. There are n vertical
# lines drawn such that the two endpoints of the ith line are (i, 0) and
# (i, height[i]).
#
# Find two lines that together with the x-axis form a container, such that
# the container contains the most water.
#
# Return the maximum amount of water a container can store.
# (You may not slant the container.)
#
# Example 1:
#   Input:  height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
#   Output: 49
#   Explanation: Lines at index 1 (height 8) and index 8 (height 7) form
#                the container with most water: min(8,7) * (8-1) = 49
#
# Example 2:
#   Input:  height = [1, 1]
#   Output: 1
#
# Constraints:
#   - n == height.length
#   - 2 <= n <= 10^5
#   - 0 <= height[i] <= 10^4
#
# Hints:
#   - Start with the widest container (pointers at both ends).
#   - The area is limited by the shorter line.
#   - Moving the pointer at the shorter line inward might find a taller line
#     and increase area. Moving the taller line's pointer can only decrease area.
#
# ============================================================================

def max_area(height)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestContainerWithMostWater < Minitest::Test
  def test_example_1
    assert_equal 49, max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])
  end

  def test_example_2
    assert_equal 1, max_area([1, 1])
  end

  def test_decreasing
    assert_equal 6, max_area([4, 3, 2, 1, 4])
  end

  def test_increasing
    assert_equal 6, max_area([1, 2, 3, 4, 5])
  end

  def test_all_same
    assert_equal 15, max_area([5, 5, 5, 5])
  end
end
