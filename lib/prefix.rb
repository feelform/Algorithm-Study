
def prefix(m)
  m.times { | index |
    prefixes = $dic.select { |word| word.length >= index + 1 }.group_by { |word| word[0, index + 1] }.max_by {|k,v| v.count }
    puts prefixes[0]
  }  
end

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

#$dic = ["dark", "date", "dave", "doc", "doc", "dock"]  # => ["dark", "date", "dave", "doc", "doc", "dock"]
#prefix(4)                                              # => 4


#$dic = ["ab", "ab", "ac", "acc", "bc", "c", "cba"]
#prefix(3)

