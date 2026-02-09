# Pattern 14: Topological Sort

## Core Idea

Order nodes in a **directed acyclic graph (DAG)** such that for every edge u→v, u comes before v. Uses BFS (Kahn's algorithm) or DFS.

## When to Use

- **Task scheduling** with dependencies
- **Course prerequisites**
- **Build order** / compilation order
- Detecting **cycles** in directed graphs

## Template — Kahn's Algorithm (BFS)

```ruby
def topological_sort(num_nodes, edges)
  graph = Hash.new { |h, k| h[k] = [] }
  in_degree = Array.new(num_nodes, 0)

  edges.each do |from, to|
    graph[from] << to
    in_degree[to] += 1
  end

  queue = (0...num_nodes).select { |i| in_degree[i] == 0 }
  result = []

  until queue.empty?
    node = queue.shift
    result << node

    graph[node].each do |neighbor|
      in_degree[neighbor] -= 1
      queue << neighbor if in_degree[neighbor] == 0
    end
  end

  result.length == num_nodes ? result : []  # empty = cycle detected
end
```

## Complexity

- **Time:** O(V + E)
- **Space:** O(V + E)

## Problems in This Folder

| File                    | Problem            | Difficulty | LeetCode # |
| ----------------------- | ------------------ | ---------- | ---------- |
| `course_schedule.rb`    | Course Schedule    | Medium     | 207        |
| `course_schedule_ii.rb` | Course Schedule II | Medium     | 210        |
