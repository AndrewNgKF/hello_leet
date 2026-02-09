# frozen_string_literal: true

# ============================================================================
# Problem: Implement Trie (LeetCode #208)
# Link:    https://leetcode.com/problems/implement-trie-prefix-tree/
# Difficulty: Medium
# Pattern: Trie
# ============================================================================
#
# A trie (prefix tree) is a tree data structure used to efficiently store
# and retrieve keys in a dataset of strings.
#
# Implement the Trie class:
#   - Trie.new          — initializes the trie
#   - insert(word)      — inserts the string word into the trie
#   - search(word)      — returns true if word is in the trie
#   - starts_with(prefix) — returns true if any word starts with prefix
#
# Example:
#   trie = Trie.new
#   trie.insert("apple")
#   trie.search("apple")    # => true
#   trie.search("app")      # => false
#   trie.starts_with("app") # => true
#   trie.insert("app")
#   trie.search("app")      # => true
#
# Constraints:
#   - 1 <= word.length, prefix.length <= 2000
#   - word and prefix consist of lowercase English letters
#
# Hints:
#   - Each node has a hash of children (char → node) and an end_of_word flag.
#   - Ruby-style: you can use nested hashes as a trie!
#     trie = Hash.new { |h, k| h[k] = h.class.new(&h.default_proc) }
#
# ============================================================================

class Trie
  def initialize
    # TODO: implement
  end

  def insert(word)
    # TODO: implement
  end

  def search(word)
    # TODO: implement
  end

  def starts_with(prefix)
    # TODO: implement
  end
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestTrie < Minitest::Test
  def setup
    @trie = Trie.new
  end

  def test_insert_and_search
    @trie.insert("apple")
    assert @trie.search("apple")
  end

  def test_search_missing
    @trie.insert("apple")
    refute @trie.search("app")
  end

  def test_starts_with
    @trie.insert("apple")
    assert @trie.starts_with("app")
  end

  def test_insert_prefix_then_search
    @trie.insert("apple")
    @trie.insert("app")
    assert @trie.search("app")
  end

  def test_empty_trie
    refute @trie.search("anything")
    refute @trie.starts_with("a")
  end

  def test_multiple_words
    %w[cat car card].each { |w| @trie.insert(w) }
    assert @trie.search("car")
    assert @trie.search("card")
    refute @trie.search("ca")
    assert @trie.starts_with("ca")
  end
end
