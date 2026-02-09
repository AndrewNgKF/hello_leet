# frozen_string_literal: true

# ============================================================================
# Problem: Minimum Window Substring (LeetCode #76)
# Link:    https://leetcode.com/problems/minimum-window-substring/
# Difficulty: Hard
# Pattern: Sliding Window (Dynamic Size)
# ============================================================================
#
# Given two strings `s` and `t` of lengths m and n respectively, return the
# minimum window substring of `s` such that every character in `t` (including
# duplicates) is included in the window. If there is no such substring,
# return the empty string "".
#
# Example 1:
#   Input:  s = "ADOBECODEBANC", t = "ABC"
#   Output: "BANC"
#
# Example 2:
#   Input:  s = "a", t = "a"
#   Output: "a"
#
# Example 3:
#   Input:  s = "a", t = "aa"
#   Output: ""
#   Explanation: Both 'a's from t must be included, but s only has one 'a'.
#
# Constraints:
#   - m == s.length, n == t.length
#   - 1 <= m, n <= 10^5
#   - s and t consist of uppercase and lowercase English letters
#
# Hints:
#   - Use a hash map to count characters needed from t.
#   - Expand the window (right pointer) to include more characters.
#   - Once the window has all characters from t, shrink from the left
#     to find the minimum.
#   - Track how many characters are "formed" (have enough count).
#
# ============================================================================

def min_window(s, t)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestMinWindowSubstring < Minitest::Test
  def test_example_1
    assert_equal "BANC", min_window("ADOBECODEBANC", "ABC")
  end

  def test_exact_match
    assert_equal "a", min_window("a", "a")
  end

  def test_not_possible
    assert_equal "", min_window("a", "aa")
  end

  def test_entire_string
    assert_equal "abc", min_window("abc", "abc")
  end

  def test_single_char_target
    assert_equal "b", min_window("aab", "b")
  end
end
