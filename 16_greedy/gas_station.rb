# frozen_string_literal: true

# ============================================================================
# Problem: Gas Station (LeetCode #134)
# Link:    https://leetcode.com/problems/gas-station/
# Difficulty: Medium
# Pattern: Greedy
# ============================================================================
#
# There are n gas stations along a circular route. Station i has gas[i]
# fuel and it costs cost[i] to travel from station i to i+1.
#
# You begin with an empty tank at one of the stations. Return the starting
# station's index if you can travel around the circuit once clockwise,
# otherwise return -1. If a solution exists, it is guaranteed to be unique.
#
# Example 1:
#   Input:  gas = [1,2,3,4,5], cost = [3,4,5,1,2]
#   Output: 3
#
# Example 2:
#   Input:  gas = [2,3,4], cost = [3,4,3]
#   Output: -1
#
# Constraints:
#   - 1 <= n <= 10^5
#
# Hints:
#   - If total gas >= total cost, a solution exists.
#   - Greedy: track current tank. If it goes negative, restart from next
#     station (everything before can't be the start).
#
# ============================================================================

def can_complete_circuit(gas, cost)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestGasStation < Minitest::Test
  def test_example_1
    assert_equal 3, can_complete_circuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2])
  end

  def test_impossible
    assert_equal(-1, can_complete_circuit([2, 3, 4], [3, 4, 3]))
  end

  def test_single_station
    assert_equal 0, can_complete_circuit([5], [3])
  end

  def test_start_at_zero
    assert_equal 0, can_complete_circuit([3, 1, 1], [1, 1, 1])
  end

  def test_exact_fuel
    assert_equal 0, can_complete_circuit([1, 1, 1], [1, 1, 1])
  end
end
