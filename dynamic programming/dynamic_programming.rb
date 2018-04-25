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
    l_conn_keys = l.keys.select do |i|  # => [], [], []
      i < j and seq[i] < seq[j]
    end                                 # => [], [], []
    
    l_conn_keys.each do |i|  # => [], [], []
      l[i] = l_conn_keys
    end                      # => [], [], []

    l  # => {}, {}, {}
  end  # => 3

  return l  # => {}
end         # => :incr_subseq

incr_subseq([1, 3, 5])  # => {}

