# frozen_string_literal: true

# ============================================================================
# Problem: First Missing Positive (LeetCode #41)
# Link:    https://leetcode.com/problems/first-missing-positive/
# Difficulty: Hard
# Pattern: Cyclic Sort
# ============================================================================
#
# Given an unsorted integer array `nums`, return the smallest missing
# positive integer.
#
# You must implement an algorithm that runs in O(n) time and uses O(1)
# auxiliary space.
#
# Example 1:
#   Input:  nums = [1, 2, 0]
#   Output: 3
#
# Example 2:
#   Input:  nums = [3, 4, -1, 1]
#   Output: 2
#
# Example 3:
#   Input:  nums = [7, 8, 9, 11, 12]
#   Output: 1
#
# Constraints:
#   - 1 <= nums.length <= 10^5
#   - -2^31 <= nums[i] <= 2^31 - 1
#
# Hints:
#   - Ignore negatives and numbers > n (they can't be the answer).
#   - Use cyclic sort to place each number in range [1, n] at index (num - 1).
#   - Then scan for the first index where nums[i] != i + 1.
#   - If all positions are correct, the answer is n + 1.
#
# ============================================================================

def first_missing_positive(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestFirstMissingPositive < Minitest::Test
  def test_example_1
    assert_equal 3, first_missing_positive([1, 2, 0])
  end

  def test_example_2
    assert_equal 2, first_missing_positive([3, 4, -1, 1])
  end

  def test_example_3
    assert_equal 1, first_missing_positive([7, 8, 9, 11, 12])
  end

  def test_complete_sequence
    assert_equal 4, first_missing_positive([1, 2, 3])
  end

  def test_single_one
    assert_equal 2, first_missing_positive([1])
  end

  def test_single_two
    assert_equal 1, first_missing_positive([2])
  end

  def test_duplicates
    assert_equal 2, first_missing_positive([1, 1])
  end
end
