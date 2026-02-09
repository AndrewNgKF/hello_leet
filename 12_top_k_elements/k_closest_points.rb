# frozen_string_literal: true

# ============================================================================
# Problem: K Closest Points to Origin (LeetCode #973)
# Link:    https://leetcode.com/problems/k-closest-points-to-origin/
# Difficulty: Medium
# Pattern: Top K Elements
# ============================================================================
#
# Given an array of points where points[i] = [x_i, y_i] represents a
# point on the X-Y plane, and an integer k, return the k closest points
# to the origin (0, 0).
#
# Distance = sqrt(x² + y²), but you can compare x² + y² directly.
#
# Example 1:
#   Input:  points = [[1,3],[-2,2]], k = 1
#   Output: [[-2,2]]
#   Explanation: dist(1,3) = sqrt(10), dist(-2,2) = sqrt(8). Closer: [-2,2].
#
# Example 2:
#   Input:  points = [[3,3],[5,-1],[-2,4]], k = 2
#   Output: [[3,3],[-2,4]]  (any order)
#
# Constraints:
#   - 1 <= k <= points.length <= 10^4
#
# Hints:
#   - Use a max-heap of size k (pop when size exceeds k).
#   - Or sort by distance and take first k.
#   - Ruby-style: points.min_by(k) { |x, y| x*x + y*y }
#
# ============================================================================

def k_closest(points, k)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestKClosest < Minitest::Test
  def dist(p)
    p[0] * p[0] + p[1] * p[1]
  end

  def test_example_1
    result = k_closest([[1, 3], [-2, 2]], 1)
    assert_equal 1, result&.length
    assert_equal [-2, 2], result&.first
  end

  def test_example_2
    result = k_closest([[3, 3], [5, -1], [-2, 4]], 2)
    assert_equal 2, result&.length
    sorted = (result || []).sort_by { |p| dist(p) }
    assert_includes sorted.map { |p| dist(p) }, dist([3, 3])
    assert_includes sorted.map { |p| dist(p) }, dist([-2, 4])
  end

  def test_k_equals_length
    result = k_closest([[1, 1], [2, 2]], 2)
    assert_equal 2, result&.length
  end

  def test_origin
    result = k_closest([[0, 0], [1, 1]], 1)
    assert_equal [[0, 0]], result
  end
end
