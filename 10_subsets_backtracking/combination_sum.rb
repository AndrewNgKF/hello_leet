# frozen_string_literal: true

# ============================================================================
# Problem: Combination Sum (LeetCode #39)
# Link:    https://leetcode.com/problems/combination-sum/
# Difficulty: Medium
# Pattern: Subsets & Backtracking
# ============================================================================
#
# Given an array of distinct integers `candidates` and a target integer
# `target`, return a list of all unique combinations of `candidates` where
# the chosen numbers sum to `target`. You may return the combinations in
# any order.
#
# The same number may be chosen from `candidates` an unlimited number of
# times. Two combinations are unique if the frequency of at least one of
# the chosen numbers is different.
#
# Example 1:
#   Input:  candidates = [2, 3, 6, 7], target = 7
#   Output: [[2, 2, 3], [7]]
#   Explanation: 2 + 2 + 3 = 7, and 7 = 7.
#
# Example 2:
#   Input:  candidates = [2, 3, 5], target = 8
#   Output: [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
#
# Example 3:
#   Input:  candidates = [2], target = 1
#   Output: []
#
# Constraints:
#   - 1 <= candidates.length <= 30
#   - 2 <= candidates[i] <= 40
#   - All elements are distinct
#   - 1 <= target <= 40
#
# Hints:
#   - Sort candidates to allow early pruning.
#   - Use backtracking with the SAME start index (not i+1) to allow reuse.
#   - If the current sum exceeds target, stop exploring that branch.
#
# ============================================================================

def combination_sum(candidates, target)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestCombinationSum < Minitest::Test
  def test_example_1
    result = combination_sum([2, 3, 6, 7], 7).map(&:sort).sort
    assert_equal [[2, 2, 3], [7]], result
  end

  def test_example_2
    result = combination_sum([2, 3, 5], 8).map(&:sort).sort
    assert_equal [[2, 2, 2, 2], [2, 3, 3], [3, 5]], result
  end

  def test_no_solution
    assert_equal [], combination_sum([2], 1)
  end

  def test_single_candidate_reused
    assert_equal [[3, 3, 3]], combination_sum([3], 9).map(&:sort).sort
  end

  def test_single_candidate_exact
    assert_equal [[7]], combination_sum([7, 3, 2], 7).map(&:sort).sort
  end
end
