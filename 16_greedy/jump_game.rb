# frozen_string_literal: true

# ============================================================================
# Problem: Jump Game (LeetCode #55)
# Link:    https://leetcode.com/problems/jump-game/
# Difficulty: Medium
# Pattern: Greedy
# ============================================================================
#
# You are given an integer array `nums`. You are initially positioned at
# the array's first index, and each element represents your maximum jump
# length at that position.
#
# Return true if you can reach the last index, false otherwise.
#
# Example 1:
#   Input:  nums = [2,3,1,1,4]
#   Output: true
#   Explanation: Jump 1 to index 1, then 3 to the last index.
#
# Example 2:
#   Input:  nums = [3,2,1,0,4]
#   Output: false
#   Explanation: You always arrive at index 3 (value 0), stuck.
#
# Constraints:
#   - 1 <= nums.length <= 10^4
#   - 0 <= nums[i] <= 10^5
#
# Hints:
#   - Greedy: track the farthest index you can reach.
#   - Scan left to right. At each index i, if i > farthest, you're stuck.
#     Otherwise, update farthest = max(farthest, i + nums[i]).
#
# ============================================================================

def can_jump(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestJumpGame < Minitest::Test
  def test_reachable
    assert can_jump([2, 3, 1, 1, 4])
  end

  def test_stuck
    refute can_jump([3, 2, 1, 0, 4])
  end

  def test_single_element
    assert can_jump([0])
  end

  def test_all_ones
    assert can_jump([1, 1, 1, 1])
  end

  def test_big_first_jump
    assert can_jump([10, 0, 0, 0, 0])
  end

  def test_zeros
    refute can_jump([0, 1])
  end
end
