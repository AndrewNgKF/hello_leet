# frozen_string_literal: true

# ============================================================================
# Basics: Arrays & Hashes in Ruby
# ============================================================================
#
# Arrays and Hashes are your bread and butter. Almost every LeetCode problem
# uses them. This file covers the Ruby-specific methods you'll reach for
# constantly.
#
# Read through each section, then solve the "Your Turn" challenges at the
# bottom.
#
# ============================================================================

# ============================================================================
# ARRAYS
# ============================================================================
#
# Ruby arrays are dynamic (grow/shrink), ordered, and can hold mixed types.
# Think of them as Python lists or JavaScript arrays.
#
# Creating:
#   nums = [1, 2, 3, 4, 5]
#   zeros = Array.new(5, 0)        # => [0, 0, 0, 0, 0]
#   grid = Array.new(3) { [] }     # => [[], [], []]  (3 independent arrays)
#
# ⚠️ GOTCHA: Array.new(3, []) creates 3 references to the SAME array!
#            Use the block form Array.new(3) { [] } for independent arrays.
#
# ============================================================================

# --- Accessing ---
# nums[0]         # first element
# nums[-1]        # last element
# nums[1..3]      # slice from index 1 to 3 (inclusive) => [2, 3, 4]
# nums[1...3]     # slice from index 1 to 3 (exclusive) => [2, 3]
# nums.first(2)   # => [1, 2]
# nums.last(2)    # => [4, 5]

# --- Adding / Removing ---
# nums << 6             # append (push) => [1, 2, 3, 4, 5, 6]
# nums.push(6)          # same as above
# nums.pop              # remove & return last => 6
# nums.unshift(0)       # prepend => [0, 1, 2, 3, 4, 5]
# nums.shift            # remove & return first => 0
# nums.delete_at(2)     # remove element at index 2
# nums.delete(3)        # remove all occurrences of 3

# --- Searching ---
# nums.include?(3)      # => true
# nums.index(3)         # => 2 (first index of 3)
# nums.count(3)         # => 1 (how many 3s)
# nums.find { |x| x > 3 }  # => 4 (first match)
# nums.select { |x| x > 3 } # => [4, 5] (all matches)

# --- Transforming ---
# nums.map { |x| x * 2 }       # => [2, 4, 6, 8, 10]
# nums.flat_map { |x| [x, -x] } # => [1, -1, 2, -2, ...]
# nums.reject { |x| x.even? }   # => [1, 3, 5]
# nums.zip([10, 20, 30])         # => [[1,10], [2,20], [3,30]]
# nums.each_with_index { |val, i| puts "#{i}: #{val}" }

# --- Sorting ---
# nums.sort                      # ascending
# nums.sort { |a, b| b <=> a }  # descending
# nums.sort_by { |x| -x }       # descending (more idiomatic)
# nums.min, nums.max             # extremes
# nums.minmax                    # => [min, max] in one call

# --- Aggregating ---
# nums.sum                       # => 15
# nums.reduce(:+)                # => 15 (same thing)
# nums.reduce(0) { |acc, x| acc + x }  # explicit
# nums.any? { |x| x > 4 }       # => true
# nums.all? { |x| x > 0 }       # => true
# nums.none? { |x| x > 10 }     # => true

# --- Useful for LeetCode ---
# nums.reverse                   # => [5, 4, 3, 2, 1]
# nums.uniq                      # remove duplicates
# nums.flatten                   # flatten nested arrays
# nums.compact                   # remove nils
# nums.combination(2).to_a       # all pairs
# nums.permutation(2).to_a       # all ordered pairs
# nums.each_cons(3) { |a, b, c| ... }  # sliding window of 3!
# nums.each_slice(2) { |chunk| ... }    # chunks of 2
# nums.tally                     # frequency count => {1=>1, 2=>1, ...}

# ============================================================================
# HASHES
# ============================================================================
#
# Hashes are key-value stores with O(1) average lookup. You'll use them for:
# - Counting frequencies (tally)
# - Memoization (DP cache)
# - Tracking seen elements
# - Mapping values to indices
#
# Creating:
#   h = {}
#   h = Hash.new(0)               # default value 0 (great for counting!)
#   h = Hash.new { |h, k| h[k] = [] }  # default to empty array
#
# ============================================================================

# --- Basic Operations ---
# h[:key] = "value"       # set
# h[:key]                 # get (nil if missing, or default if set)
# h.delete(:key)          # remove
# h.key?(:key)            # check existence => true/false
# h.fetch(:key, "default") # get with explicit default

# --- Iterating ---
# h.each { |k, v| puts "#{k}: #{v}" }
# h.each_key { |k| ... }
# h.each_value { |v| ... }
# h.map { |k, v| [k, v * 2] }.to_h   # transform values
# h.select { |k, v| v > 1 }           # filter
# h.reject { |k, v| v == 0 }          # inverse filter

# --- Useful for LeetCode ---
# h.values                  # all values as array
# h.keys                    # all keys as array
# h.min_by { |k, v| v }    # key-value pair with minimum value
# h.max_by { |k, v| v }    # key-value pair with maximum value
# h.transform_values { |v| v * 2 }  # new hash with transformed values
# h.merge(other) { |k, v1, v2| v1 + v2 }  # merge with conflict resolution

# --- Counting Pattern (SUPER common) ---
# count = Hash.new(0)
# nums.each { |n| count[n] += 1 }
# # Or just: count = nums.tally

# --- Index Mapping Pattern ---
# index_of = {}
# nums.each_with_index { |n, i| index_of[n] = i }

# ============================================================================
# YOUR TURN — Challenges
# ============================================================================
#
# Implement these small functions using array/hash methods. Each one should
# be 1-5 lines. Think about which Ruby method fits best.

# Challenge 1: Return the frequency count of each element
# Example: frequency_count([1, 2, 2, 3, 3, 3]) => {1=>1, 2=>2, 3=>3}
def frequency_count(arr)
  # TODO: implement (hint: there's a one-liner for this)
end

# Challenge 2: Return an array of elements that appear more than once
# Example: find_duplicates([1, 2, 2, 3, 3, 4]) => [2, 3]
def find_duplicates(arr)
  # TODO: implement
end

# Challenge 3: Given an array of nums and a target, return indices of the
# two numbers that add up to target (unsorted array version).
# Example: two_sum_unsorted([2, 7, 11, 15], 9) => [0, 1]
def two_sum_unsorted(nums, target)
  # TODO: implement (hint: use a hash to store {value => index})
end

# Challenge 4: Rotate an array to the right by k positions
# Example: rotate_array([1, 2, 3, 4, 5], 2) => [4, 5, 1, 2, 3]
def rotate_array(nums, k)
  # TODO: implement (hint: Ruby's rotate method, or slicing)
end

# Challenge 5: Group anagrams together
# Example: group_anagrams(["eat","tea","tan","ate","nat","bat"])
#   => [["eat","tea","ate"], ["tan","nat"], ["bat"]]
def group_anagrams(strs)
  # TODO: implement (hint: sort each word as a key, group by that key)
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestArraysAndHashes < Minitest::Test
  def test_frequency_count
    assert_equal(
      { 1 => 1, 2 => 2, 3 => 3 },
      frequency_count([1, 2, 2, 3, 3, 3])
    )
  end

  def test_frequency_count_empty
    assert_equal({}, frequency_count([]))
  end

  def test_find_duplicates
    assert_equal [2, 3], find_duplicates([1, 2, 2, 3, 3, 4]).sort
  end

  def test_find_duplicates_none
    assert_equal [], find_duplicates([1, 2, 3])
  end

  def test_two_sum_unsorted
    result = two_sum_unsorted([2, 7, 11, 15], 9)
    assert_equal [0, 1], result.sort
  end

  def test_two_sum_unsorted_middle
    result = two_sum_unsorted([3, 2, 4], 6)
    assert_equal [1, 2], result.sort
  end

  def test_rotate_array
    assert_equal [4, 5, 1, 2, 3], rotate_array([1, 2, 3, 4, 5], 2)
  end

  def test_rotate_array_full
    assert_equal [1, 2, 3], rotate_array([1, 2, 3], 3)
  end

  def test_rotate_array_more_than_length
    assert_equal [3, 1, 2], rotate_array([1, 2, 3], 4)
  end

  def test_group_anagrams
    result = group_anagrams(%w[eat tea tan ate nat bat])
    sorted_result = result.map(&:sort).sort
    assert_equal [%w[ate eat tea], ["bat"], %w[nat tan]], sorted_result
  end

  def test_group_anagrams_empty_string
    assert_equal [[""]], group_anagrams([""])
  end
end
