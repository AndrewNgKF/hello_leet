# frozen_string_literal: true

# ============================================================================
# Problem: Climbing Stairs (LeetCode #70)
# Link:    https://leetcode.com/problems/climbing-stairs/
# Difficulty: Easy
# Pattern: Dynamic Programming (1D)
# ============================================================================
#
# You are climbing a staircase. It takes `n` steps to reach the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways
# can you climb to the top?
#
# Example 1:
#   Input:  n = 2
#   Output: 2
#   Explanation: (1+1) or (2). Two ways.
#
# Example 2:
#   Input:  n = 3
#   Output: 3
#   Explanation: (1+1+1), (1+2), (2+1). Three ways.
#
# Example 3:
#   Input:  n = 4
#   Output: 5
#   Explanation: (1+1+1+1), (1+1+2), (1+2+1), (2+1+1), (2+2). Five ways.
#
# Constraints:
#   - 1 <= n <= 45
#
# Hints:
#   - This is the Fibonacci sequence! dp[n] = dp[n-1] + dp[n-2].
#   - From step n, you could have come from step n-1 (1 step) or n-2 (2 steps).
#   - Base cases: dp[1] = 1, dp[2] = 2.
#   - You can optimize space to O(1) by only keeping the last two values.
#
# ============================================================================

def climb_stairs(n)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestClimbingStairs < Minitest::Test
  def test_one_step
    assert_equal 1, climb_stairs(1)
  end

  def test_two_steps
    assert_equal 2, climb_stairs(2)
  end

  def test_three_steps
    assert_equal 3, climb_stairs(3)
  end

  def test_four_steps
    assert_equal 5, climb_stairs(4)
  end

  def test_five_steps
    assert_equal 8, climb_stairs(5)
  end

  def test_ten_steps
    assert_equal 89, climb_stairs(10)
  end
end
