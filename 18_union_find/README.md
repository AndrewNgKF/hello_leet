# Pattern 18: Union Find (Disjoint Set)

## Core Idea

Track **connected components** using a forest of trees. Two operations: **find** (which set does an element belong to?) and **union** (merge two sets). With path compression and union by rank, both operations are nearly O(1).

## When to Use

- **Connected components** in a graph
- Detecting **cycles** in undirected graphs
- **Dynamic connectivity** — elements get connected over time
- Problems where you need to **group** things together

## Template

```ruby
class UnionFind
  def initialize(n)
    @parent = (0...n).to_a
    @rank = Array.new(n, 0)
  end

  def find(x)
    @parent[x] = find(@parent[x]) if @parent[x] != x  # path compression
    @parent[x]
  end

  def union(x, y)
    px, py = find(x), find(y)
    return false if px == py  # already connected

    # union by rank
    if @rank[px] < @rank[py]
      @parent[px] = py
    elsif @rank[px] > @rank[py]
      @parent[py] = px
    else
      @parent[py] = px
      @rank[px] += 1
    end

    true
  end

  def connected?(x, y)
    find(x) == find(y)
  end
end
```

## Complexity

- **Time:** O(α(n)) per operation ≈ O(1) amortized (inverse Ackermann)
- **Space:** O(n)

## Problems in This Folder

| File                      | Problem                                 | Difficulty | LeetCode # |
| ------------------------- | --------------------------------------- | ---------- | ---------- |
| `number_of_islands.rb`    | Number of Islands (Union Find approach) | Medium     | 200        |
| `redundant_connection.rb` | Redundant Connection                    | Medium     | 684        |
