# Pattern 19: Trie (Prefix Tree)

## Core Idea

A tree-like data structure for efficient **string prefix lookups**. Each node represents a character, and paths from root to nodes represent prefixes.

## When to Use

- **Autocomplete** / prefix matching
- **Word search** in a grid
- **Spell checking**
- Efficiently storing and searching a **dictionary of words**

## Template

```ruby
class TrieNode
  attr_accessor :children, :end_of_word

  def initialize
    @children = {}
    @end_of_word = false
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root
    word.each_char do |ch|
      node.children[ch] ||= TrieNode.new
      node = node.children[ch]
    end
    node.end_of_word = true
  end

  def search(word)
    node = find_node(word)
    node&.end_of_word == true
  end

  def starts_with(prefix)
    !find_node(prefix).nil?
  end

  private

  def find_node(prefix)
    node = @root
    prefix.each_char do |ch|
      return nil unless node.children[ch]
      node = node.children[ch]
    end
    node
  end
end
```

## Complexity

- **Time:** O(m) per operation where m = word length
- **Space:** O(n × m) total for n words of average length m

## Problems in This Folder

| File                | Problem                      | Difficulty | LeetCode # |
| ------------------- | ---------------------------- | ---------- | ---------- |
| `implement_trie.rb` | Implement Trie (Prefix Tree) | Medium     | 208        |
| `word_search_ii.rb` | Word Search II               | Hard       | 212        |
