# frozen_string_literal: true

# ============================================================================
# Problem: Coin Change (LeetCode #322)
# Link:    https://leetcode.com/problems/coin-change/
# Difficulty: Medium
# Pattern: Dynamic Programming (1D)
# ============================================================================
#
# You are given an integer array `coins` representing coins of different
# denominations and an integer `amount` representing a total amount of money.
#
# Return the fewest number of coins that you need to make up that amount.
# If that amount of money cannot be made up by any combination of the coins,
# return -1.
#
# You may assume that you have an infinite number of each kind of coin.
#
# Example 1:
#   Input:  coins = [1, 5, 10, 25], amount = 30
#   Output: 2
#   Explanation: 25 + 5 = 30. Two coins.
#
# Example 2:
#   Input:  coins = [2], amount = 3
#   Output: -1
#   Explanation: Cannot make 3 with only 2-cent coins.
#
# Example 3:
#   Input:  coins = [1], amount = 0
#   Output: 0
#
# Constraints:
#   - 1 <= coins.length <= 12
#   - 1 <= coins[i] <= 2^31 - 1
#   - 0 <= amount <= 10^4
#
# Hints:
#   - dp[i] = minimum coins to make amount i.
#   - dp[0] = 0 (zero coins for zero amount).
#   - For each amount i, try each coin: dp[i] = min(dp[i], dp[i - coin] + 1).
#   - Initialize dp with infinity (or amount + 1).
#
# ============================================================================

def coin_change(coins, amount)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestCoinChange < Minitest::Test
  def test_standard_coins
    assert_equal 2, coin_change([1, 5, 10, 25], 30)
  end

  def test_impossible
    assert_equal(-1, coin_change([2], 3))
  end

  def test_zero_amount
    assert_equal 0, coin_change([1], 0)
  end

  def test_example_leetcode
    assert_equal 3, coin_change([1, 2, 5], 11) # 5 + 5 + 1
  end

  def test_single_coin
    assert_equal 5, coin_change([3], 15)
  end

  def test_greedy_doesnt_work
    # Greedy would pick 4, then fail. DP finds 3+3+3+3 = 12
    assert_equal 3, coin_change([1, 3, 4], 6) # 3+3, not 4+1+1
  end
end
