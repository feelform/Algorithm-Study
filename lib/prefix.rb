require 'set'  # => true

def prefix(m)
  m.times { | index |                                                                                # => 4, 3
    prefixes = $dic.select { |prefix| prefix.length >= index + 1 }.map {|word| word[0, index + 1] }  # => ["d", "d", "d", "d", "d", "d"], ["da", "da", "da", "do", "do", "do"], ["dar", "dat", "dav", "doc", "doc", "doc"], ["dark", "date", "dave", "dock"], ["a", "a", "a", "a", "b", "c", "c"], ["ab", "ab", "ac", "ac", "bc", "cb"], ["acc", "cba"]
    
    prefixes_keys = prefixes|[]                                         # => ["d"], ["da", "do"], ["dar", "dat", "dav", "doc"], ["dark", "date", "dave", "dock"], ["a", "b", "c"], ["ab", "ac", "bc", "cb"], ["acc", "cba"]
    prefixes_values = prefixes_keys.map { |key| prefixes.count(key)  }  # => [6],   [3, 3],       [1, 1, 1, 3],                 [1, 1, 1, 1],                     [4, 1, 2],       [2, 2, 1, 1],             [1, 1]
    
    index = prefixes_values.each_index.max_by { |i| prefixes_values[i] }  # => 0, 0, 3, 0, 0, 0, 0

    puts prefixes_keys[index]  # => nil, nil, nil, nil, nil, nil, nil
  }                            # => 4, 3
  
end  # => :prefix

def run()
  gets.to_i.times { |i|                                # => 0
    $dic = []
    word_count, prefix_count = gets.split.map(&:to_i)
    word_count.times { $dic.push(gets.chomp)}
    prefix(prefix_count)
  }                                                    # => 0
end                                                    # => :run

run()  # => 0

require 'benchmark'  # => true

puts Benchmark.measure {  # => Benchmark

$dic = ["dark", "date", "dave", "doc", "doc", "dock"]  # => ["dark", "date", "dave", "doc", "doc", "dock"]
prefix(4)                                              # => 4


$dic = ["ab", "ab", "ac", "acc", "bc", "c", "cba"]  # => ["ab", "ab", "ac", "acc", "bc", "c", "cba"]
prefix(3)                                           # => 3

}  # => nil

#$dic = ["dark", "date", "dave", "doc", "doc", "dock"]  # => ["dark", "date", "dave", "doc", "doc", "dock"]
#prefix(4)                                              # => 4


#$dic = ["ab", "ab", "ac", "acc", "bc", "c", "cba"]
#prefix(3)

# >> d
# >> da
# >> doc
# >> dark
# >> a
# >> ab
# >> acc
# >>   0.000472   0.000262   0.000734 (  0.000560)

