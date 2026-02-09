# frozen_string_literal: true

# ============================================================================
# Problem: Longest Substring Without Repeating Characters (LeetCode #3)
# Link:    https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Difficulty: Medium
# Pattern: Sliding Window (Dynamic Size)
# ============================================================================
#
# Given a string `s`, find the length of the longest substring without
# repeating characters.
#
# Example 1:
#   Input:  s = "abcabcbb"
#   Output: 3
#   Explanation: "abc" is the longest substring without repeating characters.
#
# Example 2:
#   Input:  s = "bbbbb"
#   Output: 1
#   Explanation: "b" is the longest.
#
# Example 3:
#   Input:  s = "pwwkew"
#   Output: 3
#   Explanation: "wke" is the answer. Note that "pwke" is a subsequence, not
#                a substring.
#
# Constraints:
#   - 0 <= s.length <= 5 * 10^4
#   - s consists of English letters, digits, symbols, and spaces
#
# Hints:
#   - Use a hash to track the last index of each character.
#   - Expand the right pointer each step.
#   - When you find a duplicate, move the left pointer past the previous
#     occurrence of that character.
#
# ============================================================================

def length_of_longest_substring(s)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestLongestSubstringNoRepeat < Minitest::Test
  def test_example_1
    assert_equal 3, length_of_longest_substring("abcabcbb")
  end

  def test_all_same
    assert_equal 1, length_of_longest_substring("bbbbb")
  end

  def test_example_3
    assert_equal 3, length_of_longest_substring("pwwkew")
  end

  def test_empty_string
    assert_equal 0, length_of_longest_substring("")
  end

  def test_all_unique
    assert_equal 5, length_of_longest_substring("abcde")
  end

  def test_single_char
    assert_equal 1, length_of_longest_substring("a")
  end

  def test_with_spaces
    assert_equal 7, length_of_longest_substring("abcd fg")
  end
end
