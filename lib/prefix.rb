require 'set'  # => true

def prefix(m)
  m.times { | index |                                                                                # => 4
    prefixes = $dic.select { |prefix| prefix.length >= index + 1 }.map {|word| word[0, index + 1] }  # => ["d", "d", "d", "d", "d", "d"], ["da", "da", "da", "do", "do", "do"], ["dar", "dat", "dav", "doc", "doc", "doc"], ["dark", "date", "dave", "dock"]
    prefixes_keys = prefixes|[]                                                                      # => ["d"],                          ["da", "do"],                         ["dar", "dat", "dav", "doc"],               ["dark", "date", "dave", "dock"]
    
    prefixes_values = prefixes_keys.map { |key| prefixes.count(key)  }  # => [6], [3, 3], [1, 1, 1, 3], [1, 1, 1, 1]

    max = prefixes_values.max  # => 6, 3, 3, 1
    
    index = prefixes_values.index(prefixes_values.max)  # => 0, 0, 3, 0

    puts prefixes_keys[index]  # => nil, nil, nil, nil
  }                            # => 4
  
end                                                    # => :prefix
=begin
def run()
  gets.to_i.times { |i|
    $dic = []
    word_count, prefix_count = gets.split.map(&:to_i)
    word_count.times { $dic.push(gets.chomp)}
    prefix(prefix_count)
  }
end

run()

require 'benchmark'

puts Benchmark.measure {

$dic = ["dark", "date", "dave", "doc", "doc", "dock"]
prefix(4)


$dic = ["ab", "ab", "ac", "acc", "bc", "c", "cba"]
prefix(3)

}
=end
$dic = ["dark", "date", "dave", "doc", "doc", "dock"]  # => ["dark", "date", "dave", "doc", "doc", "dock"]
prefix(4)                                              # => 4


#$dic = ["ab", "ab", "ac", "acc", "bc", "c", "cba"]
#prefix(3)

# >> d
# >> da
# >> doc
# >> dark

