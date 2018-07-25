
def prefix(m)
  m.times { | index |                                                                               # => 4, 3
    prefixes = DIC.map {|word| word[0, index + 1] }.select { |prefix| prefix.length == index + 1 }  # => ["d", "d", "d", "d", "d", "d"], ["da", "da", "da", "do", "do", "do"], ["dar", "dat", "dav", "doc", "doc", "doc"], ["dark", "date", "dave", "dock"], ["a", "a", "a", "a", "b", "c", "c"], ["ab", "ab", "ac", "ac", "bc", "cb"], ["acc", "cba"]
    prefixes_keys = prefixes|[]                                                                     # => ["d"],                          ["da", "do"],                         ["dar", "dat", "dav", "doc"],               ["dark", "date", "dave", "dock"], ["a", "b", "c"],                     ["ab", "ac", "bc", "cb"],             ["acc", "cba"]

    if prefixes_keys.size == 1  # => true, false, false, false, false, false, false
      puts prefixes_keys[0]     # => nil
      next
    end

    prefixes_values = prefixes_keys.map { |key| prefixes.select { |prefix| prefix == key }.size  }  # => [3, 3], [1, 1, 1, 3], [1, 1, 1, 1], [4, 1, 2], [2, 2, 1, 1], [1, 1]

    max_of_prefixes_values = prefixes_values.max  # => 3, 3, 1, 4, 2, 1

    index = prefixes_values.index(max_of_prefixes_values)  # => 0, 3, 0, 0, 0, 0

    puts prefixes_keys[index]  # => nil, nil, nil, nil, nil, nil
  }                            # => 4, 3
  
end  # => :prefix

DIC = ["dark", "date", "dave", "doc", "doc", "dock"]  # => ["dark", "date", "dave", "doc", "doc", "dock"]
prefix(4)                                             # => 4


DIC = ["ab", "ab", "ac", "acc", "bc", "c", "cba"]  # => ["ab", "ab", "ac", "acc", "bc", "c", "cba"]
prefix(3)                                          # => 3

# >> d
# >> da
# >> doc
# >> dark
# >> a
# >> ab
# >> acc
