def longest_incr_subseq(seq)
  l = {}

  seq.length.times do |j|
    l_conn_keys = l.keys.select do |i|
      i < j and seq[i] < seq[j]
    end

    l_conn_values = l_conn_keys.map do |k|
      l[k]
    end

    l[j] = 1 + (l_conn_values.max || 0)
  end

  puts l
  return l.values.max
end                    # => :longest_incr_subseq

def incr_subseq(seq)
  l = {}              # => {}, {}
  
  seq.length.times do |j|               # => 3, 5
    l_conn_keys = l.keys.select do |i|  # => [], [0], [0, 1], [], [0], [0, 1], [0, 1, 2], [0, 1, 2, 3]
      i < j and seq[i] < seq[j]         # => true, true, true, true, true, true, false, false, false, false, ...
    end                                 # => [], [0], [0, 1], [], [0], [0, 1], [], [3]

    l_conn_values = l_conn_keys.map { |k| seq[k] }  # => [], [1], [1, 3], [], [10], [10, 20], [], [1]

    l_conn_keys.each do |key|  # => [], [0], [0, 1], [], [0], [0, 1], [], [3]
      l[key] = false           # => false, false, false, false, false, false, false
    end                        # => [], [0], [0, 1], [], [0], [0, 1], [], [3]

    l[j] = l_conn_values ? l_conn_values.push(seq[j]) : [seq[j]]  # => [1], [1, 3], [1, 3, 5], [10], [10, 20], [10, 20, 30], [1], [1, 2]
  end                                                             # => 3, 5
  
  return l.select { |k,v| v != false }  # => {2=>[1, 3, 5]}, {2=>[10, 20, 30], 4=>[1, 2]}
end                                     # => :incr_subseq

incr_subseq([1, 3, 5])           # => {2=>[1, 3, 5]}
incr_subseq([10, 20, 30, 1, 2])  # => {2=>[10, 20, 30], 4=>[1, 2]}


