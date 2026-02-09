# frozen_string_literal: true

# ============================================================================
# Problem: Permutations (LeetCode #46)
# Link:    https://leetcode.com/problems/permutations/
# Difficulty: Medium
# Pattern: Subsets & Backtracking
# ============================================================================
#
# Given an array `nums` of distinct integers, return all the possible
# permutations. You can return the answer in any order.
#
# Example 1:
#   Input:  nums = [1, 2, 3]
#   Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
#
# Example 2:
#   Input:  nums = [0, 1]
#   Output: [[0, 1], [1, 0]]
#
# Example 3:
#   Input:  nums = [1]
#   Output: [[1]]
#
# Constraints:
#   - 1 <= nums.length <= 6
#   - -10 <= nums[i] <= 10
#   - All integers are unique
#
# Hints:
#   - Unlike subsets, permutations use ALL elements — just in different orders.
#   - At each step, choose any unused element to add next.
#   - Track which elements are used (via a remaining list or a boolean array).
#   - Base case: when current permutation length == nums length, add to result.
#
# ============================================================================

def permute(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestPermutations < Minitest::Test
  def test_three_elements
    result = permute([1, 2, 3]).map(&:dup).sort
    expected = [
      [1, 2, 3],
      [1, 3, 2],
      [2, 1, 3],
      [2, 3, 1],
      [3, 1, 2],
      [3, 2, 1]
    ].sort
    assert_equal expected, result
  end

  def test_two_elements
    result = permute([0, 1]).sort
    assert_equal [[0, 1], [1, 0]], result
  end

  def test_single_element
    assert_equal [[1]], permute([1])
  end

  def test_count
    # n! permutations
    assert_equal 24, permute([1, 2, 3, 4]).length
  end
end
