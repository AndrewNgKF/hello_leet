# frozen_string_literal: true

# ============================================================================
# Problem: Next Greater Element I (LeetCode #496)
# Link:    https://leetcode.com/problems/next-greater-element-i/
# Difficulty: Easy
# Pattern: Monotonic Stack
# ============================================================================
#
# The next greater element of an element x in an array is the first
# greater element to its right. You are given two distinct 0-indexed
# integer arrays `nums1` and `nums2` where nums1 is a subset of nums2.
#
# For each nums1[i], find the index j such that nums1[i] == nums2[j]
# and determine the next greater element of nums2[j] in nums2. If there
# is no next greater element, the answer for that query is -1.
#
# Example 1:
#   Input:  nums1 = [4,1,2], nums2 = [1,3,4,2]
#   Output: [-1,3,-1]
#
# Example 2:
#   Input:  nums1 = [2,4], nums2 = [1,2,3,4]
#   Output: [3,-1]
#
# Constraints:
#   - 1 <= nums1.length <= nums2.length <= 1000
#   - All values are unique
#
# Hints:
#   - Use a monotonic decreasing stack to precompute next greater for all
#     elements in nums2, store in a hash map.
#   - Then look up each element in nums1.
#
# ============================================================================

def next_greater_element(nums1, nums2)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestNextGreater < Minitest::Test
  def test_example_1
    assert_equal [-1, 3, -1], next_greater_element([4, 1, 2], [1, 3, 4, 2])
  end

  def test_example_2
    assert_equal [3, -1], next_greater_element([2, 4], [1, 2, 3, 4])
  end

  def test_all_decreasing
    assert_equal [-1, -1, -1], next_greater_element([3, 2, 1], [3, 2, 1])
  end

  def test_all_increasing
    assert_equal [2, 3, 4], next_greater_element([1, 2, 3], [1, 2, 3, 4])
  end

  def test_single
    assert_equal [-1], next_greater_element([1], [1])
  end
end
