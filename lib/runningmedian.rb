require 'set'  # => true

def running_median(n, a, b)
  input = 1983                  # => 1983
  sum = input                   # => 1983
  seq = SortedSet.new([input])  # => #<SortedSet: {1983}>
  
  (n-1).times {                         # => 9
    input = (input * a + b) % 20090711  # => 1983, 1983, 1983, 1983, 1983, 1983, 1983, 1983, 1983

    seq.add(input)        # => #<SortedSet: {1983}>, #<SortedSet: {1983}>, #<SortedSet: {1983}>, #<SortedSet: {1983}>, #<SortedSet: {1983}>, #<SortedSet: {1983}>, #<SortedSet: {1983}>, #<SortedSet: {1983}>, #<SortedSet: {1983}>
    seq_array = seq.to_a  # => [1983],               [1983],               [1983],               [1983],               [1983],               [1983],               [1983],               [1983],               [1983]

    mid_offset = seq_array.size % 2 == 0 ? -1 : 0       # => 0,    0,    0,    0,    0,    0,    0,    0,    0
    mid_index = (seq_array.size / 2).to_i + mid_offset  # => 0,    0,    0,    0,    0,    0,    0,    0,    0
    mid = seq_array[mid_index]                          # => 1983, 1983, 1983, 1983, 1983, 1983, 1983, 1983, 1983

    sum = (sum + mid) % 20090711  # => 3966, 5949, 7932, 9915, 11898, 13881, 15864, 17847, 19830
  }                               # => 9

  sum  # => 19830
end    # => :running_median

def run()
  gets.to_i.times {                                 # => 0
    args = gets.split.map(&:to_i)
    puts running_median(args[0], args[1], args[2])
  }                                                 # => 0
end                                                 # => :run

run()  # => 0


running_median(10, 1, 0)  # => 19830
#running_median(10, 1, 1)
#running_median(10000, 1273, 4936)


