# frozen_string_literal: true

# ============================================================================
# Problem: Longest Common Subsequence (LeetCode #1143)
# Link:    https://leetcode.com/problems/longest-common-subsequence/
# Difficulty: Medium
# Pattern: Dynamic Programming (2D)
# ============================================================================
#
# Given two strings `text1` and `text2`, return the length of their longest
# common subsequence. If there is no common subsequence, return 0.
#
# A subsequence of a string is a new string generated from the original
# string with some characters (can be none) deleted without changing the
# relative order of the remaining characters.
#
# Example 1:
#   Input:  text1 = "abcde", text2 = "ace"
#   Output: 3
#   Explanation: The longest common subsequence is "ace".
#
# Example 2:
#   Input:  text1 = "abc", text2 = "abc"
#   Output: 3
#
# Example 3:
#   Input:  text1 = "abc", text2 = "def"
#   Output: 0
#
# Constraints:
#   - 1 <= text1.length, text2.length <= 1000
#   - text1 and text2 consist of only lowercase English characters
#
# Hints:
#   - dp[i][j] = LCS of text1[0..i-1] and text2[0..j-1].
#   - If text1[i-1] == text2[j-1]: dp[i][j] = dp[i-1][j-1] + 1
#   - Else: dp[i][j] = max(dp[i-1][j], dp[i][j-1])
#   - Base case: dp[0][j] = dp[i][0] = 0 (empty string has LCS 0).
#
# ============================================================================

def longest_common_subsequence(text1, text2)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestLCS < Minitest::Test
  def test_example_1
    assert_equal 3, longest_common_subsequence("abcde", "ace")
  end

  def test_identical
    assert_equal 3, longest_common_subsequence("abc", "abc")
  end

  def test_no_common
    assert_equal 0, longest_common_subsequence("abc", "def")
  end

  def test_single_char_match
    assert_equal 1, longest_common_subsequence("a", "a")
  end

  def test_single_char_no_match
    assert_equal 0, longest_common_subsequence("a", "b")
  end

  def test_longer_strings
    assert_equal 4, longest_common_subsequence("abcdef", "acbdfe")
  end
end
