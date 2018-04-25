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
  l = {}              # => {}

  seq.length.times do |j|               # => 3
    l_conn_keys = l.keys.select do |i|  # => [],   [0],  [0, 1]
      i < j and seq[i] < seq[j]         # => true, true, true
    end                                 # => [],   [0],  [0, 1]

    l_conn_values = l_conn_keys.map { |k| seq[k] }  # => [], [1], [1, 3]

    l[j] = l_conn_values ? l_conn_values.push(seq[j]) : [seq[j]]  # => [1], [1, 3], [1, 3, 5]
  end                                                             # => 3

  return l  # => {0=>[1], 1=>[1, 3], 2=>[1, 3, 5]}
end         # => :incr_subseq

incr_subseq([1, 3, 5])  # => {0=>[1], 1=>[1, 3], 2=>[1, 3, 5]}

