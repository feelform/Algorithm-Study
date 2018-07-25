require 'set'

def prefix(m)
  m.times { | index |
    prefixes = $dic.select { |prefix| prefix.length >= index + 1 }.map {|word| word[0, index + 1] }
    
    prefixes_keys = prefixes|[]
    prefixes_values = prefixes_keys.map { |key| prefixes.count(key)  }
    
    index = prefixes_values.index(prefixes_values.max)

    puts prefixes_keys[index]
  }
  
end
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
$dic = ["dark", "date", "dave", "doc", "doc", "dock"]
prefix(4)


#$dic = ["ab", "ab", "ac", "acc", "bc", "c", "cba"]
#prefix(3)

