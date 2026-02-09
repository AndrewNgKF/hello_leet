# Pattern 4: Merge Intervals

## Core Idea

When dealing with **overlapping intervals**, sort by start time, then iterate and merge/compare overlapping intervals in a single pass.

## When to Use

- Problems involving **time ranges, meetings, schedules**
- Merging overlapping intervals
- Finding **gaps** or **intersections**
- Inserting a new interval into a sorted list

## Template

```ruby
def merge(intervals)
  intervals.sort_by! { |i| i[0] }
  merged = [intervals[0]]

  intervals[1..].each do |current|
    last = merged.last
    if current[0] <= last[1]  # overlapping
      last[1] = [last[1], current[1]].max  # merge
    else
      merged << current  # no overlap
    end
  end

  merged
end
```

## Key Insight

Two intervals `[a, b]` and `[c, d]` overlap if and only if `a <= d && c <= b`. After sorting by start, you only need to check `current.start <= previous.end`.

## Complexity

- **Time:** O(n log n) for sorting + O(n) for merging
- **Space:** O(n) for the result

## Problems in This Folder

| File                 | Problem          | Difficulty | LeetCode # |
| -------------------- | ---------------- | ---------- | ---------- |
| `merge_intervals.rb` | Merge Intervals  | Medium     | 56         |
| `insert_interval.rb` | Insert Interval  | Medium     | 57         |
| `meeting_rooms.rb`   | Meeting Rooms II | Medium     | 253        |
