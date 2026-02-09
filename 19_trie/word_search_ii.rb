# frozen_string_literal: true

# ============================================================================
# Problem: Word Search II (LeetCode #212)
# Link:    https://leetcode.com/problems/word-search-ii/
# Difficulty: Hard
# Pattern: Trie
# ============================================================================
#
# Given an m x n board of characters and a list of strings `words`,
# return all words on the board.
#
# Each word must be constructed from letters of sequentially adjacent cells
# (horizontally or vertically). The same cell may not be used more than
# once in a word.
#
# Example 1:
#   Input:  board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]
#           words = ["oath","pea","eat","rain"]
#   Output: ["eat","oath"]
#
# Example 2:
#   Input:  board = [["a","b"],["c","d"]]
#           words = ["abcb"]
#   Output: []
#
# Constraints:
#   - m == board.length, n == board[i].length
#   - 1 <= m, n <= 12
#   - 1 <= words.length <= 3 * 10^4
#   - 1 <= words[i].length <= 10
#
# Hints:
#   - Build a trie from all words. DFS from each cell, following trie edges.
#   - Prune: if the current trie node has no children matching, stop.
#   - When you reach an end-of-word marker, add the word to results.
#   - Optimization: remove words from trie once found (avoid duplicates).
#
# ============================================================================

def find_words(board, words)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestWordSearchII < Minitest::Test
  def test_example_1
    board = [%w[o a a n], %w[e t a e], %w[i h k r], %w[i f l v]]
    words = %w[oath pea eat rain]
    result = (find_words(board, words) || []).sort
    assert_equal %w[eat oath], result
  end

  def test_no_match
    board = [%w[a b], %w[c d]]
    assert_equal [], (find_words(board, %w[abcb]) || [])
  end

  def test_single_letter
    board = [%w[a]]
    assert_equal %w[a], find_words(board, %w[a])
  end

  def test_all_words_found
    board = [%w[a b], %w[c d]]
    result = (find_words(board, %w[ab cd ac]) || []).sort
    assert_equal %w[ab ac cd], result
  end
end
