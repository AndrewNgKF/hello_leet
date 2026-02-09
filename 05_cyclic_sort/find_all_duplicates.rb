# frozen_string_literal: true

# ============================================================================
# Problem: Find All Duplicates in an Array (LeetCode #442)
# Link:    https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
# Difficulty: Medium
# Pattern: Cyclic Sort
# ============================================================================
#
# Given an integer array `nums` of length n where all integers are in the
# range [1, n] and each integer appears once or twice, return an array of
# all integers that appear twice.
#
# You must write an algorithm that runs in O(n) time and uses only O(1)
# extra space (not counting the output).
#
# Example 1:
#   Input:  nums = [4,3,2,7,8,2,3,1]
#   Output: [2,3]
#
# Example 2:
#   Input:  nums = [1,1,2]
#   Output: [1]
#
# Constraints:
#   - n == nums.length
#   - 1 <= n <= 10^5
#   - 1 <= nums[i] <= n
#   - Each element appears once or twice
#
# Hints:
#   - Cyclic sort: place each number at index (num - 1). Numbers that
#     can't be placed (their spot is taken by the same number) are duplicates.
#   - Ruby-style: nums.tally.select { |_, v| v > 1 }.keys — but O(n) space.
#
# ============================================================================

def find_duplicates(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestFindDuplicates < Minitest::Test
  def test_example_1
    assert_equal [2, 3], find_duplicates([4, 3, 2, 7, 8, 2, 3, 1]).sort
  end

  def test_example_2
    assert_equal [1], find_duplicates([1, 1, 2])
  end

  def test_no_duplicates
    assert_equal [], find_duplicates([1, 2, 3, 4])
  end

  def test_single_element
    assert_equal [], find_duplicates([1])
  end

  def test_all_duplicates
    assert_equal [1, 2, 3], find_duplicates([1, 1, 2, 2, 3, 3]).sort
  end
end
