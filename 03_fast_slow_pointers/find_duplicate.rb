# frozen_string_literal: true

# ============================================================================
# Problem: Find the Duplicate Number (LeetCode #287)
# Link:    https://leetcode.com/problems/find-the-duplicate-number/
# Difficulty: Medium
# Pattern: Fast & Slow Pointers
# ============================================================================
#
# Given an array of integers `nums` containing n + 1 integers where each
# integer is in the range [1, n] inclusive, there is only one repeated
# number. Return this repeated number.
#
# You must solve it WITHOUT modifying the array and using only O(1) extra space.
#
# Example 1:
#   Input:  nums = [1, 3, 4, 2, 2]
#   Output: 2
#
# Example 2:
#   Input:  nums = [3, 1, 3, 4, 2]
#   Output: 3
#
# Constraints:
#   - 1 <= n <= 10^5
#   - nums.length == n + 1
#   - 1 <= nums[i] <= n
#   - There is only one duplicate, but it could appear more than twice
#
# Hints:
#   - Treat the array as a linked list where nums[i] points to index nums[i].
#     Since there's a duplicate, there MUST be a cycle.
#   - Use Floyd's cycle detection: find where slow & fast meet, then find
#     the cycle start (that's the duplicate!).
#   - Phase 1: slow = nums[slow], fast = nums[nums[fast]] until they meet.
#   - Phase 2: Reset one pointer to 0, move both one step at a time — they
#     meet at the cycle start.
#   - Ruby-style shortcut: nums.tally.find { |_, v| v > 1 }.first — but
#     that's O(n) space, which violates the constraint!
#
# ============================================================================

def find_duplicate(nums)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestFindDuplicate < Minitest::Test
  def test_example_1
    assert_equal 2, find_duplicate([1, 3, 4, 2, 2])
  end

  def test_example_2
    assert_equal 3, find_duplicate([3, 1, 3, 4, 2])
  end

  def test_duplicate_at_start
    assert_equal 1, find_duplicate([1, 1, 2, 3, 4])
  end

  def test_all_same
    assert_equal 2, find_duplicate([2, 2, 2, 2, 2])
  end

  def test_two_elements
    assert_equal 1, find_duplicate([1, 1])
  end
end
