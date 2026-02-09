# frozen_string_literal: true

# ============================================================================
# Problem: Task Scheduler (LeetCode #621)
# Link:    https://leetcode.com/problems/task-scheduler/
# Difficulty: Medium
# Pattern: Greedy
# ============================================================================
#
# Given a character array `tasks` representing CPU tasks (A-Z) and a
# non-negative integer `n` (cooldown between same tasks), return the
# minimum number of intervals the CPU needs to finish all tasks.
#
# Example 1:
#   Input:  tasks = ["A","A","A","B","B","B"], n = 2
#   Output: 8
#   Explanation: A -> B -> idle -> A -> B -> idle -> A -> B
#
# Example 2:
#   Input:  tasks = ["A","A","A","B","B","B"], n = 0
#   Output: 6
#
# Constraints:
#   - 1 <= tasks.length <= 10^4
#   - tasks[i] is uppercase English letter
#   - 0 <= n <= 100
#
# Hints:
#   - Formula approach: the most frequent task defines the frame.
#     slots = (max_freq - 1) * (n + 1) + count_of_tasks_with_max_freq
#     Answer = max(slots, tasks.length) — can't be fewer than total tasks.
#   - Ruby-style: tasks.tally.values to get frequencies.
#
# ============================================================================

def least_interval(tasks, n)
  # TODO: implement
end

# ============================================================================
# Tests
# ============================================================================
require "minitest/autorun"

class TestTaskScheduler < Minitest::Test
  def test_example_1
    assert_equal 8, least_interval(%w[A A A B B B], 2)
  end

  def test_no_cooldown
    assert_equal 6, least_interval(%w[A A A B B B], 0)
  end

  def test_example_3
    assert_equal 16, least_interval(%w[A A A A A A B C D E F G], 2)
  end

  def test_single_task
    assert_equal 1, least_interval(%w[A], 2)
  end

  def test_all_different
    assert_equal 3, least_interval(%w[A B C], 2)
  end
end
