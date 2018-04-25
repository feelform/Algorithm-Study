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
  l = {}              # => {}, {}, {}, {}, {}, {}
  
  seq.length.times do |j|               # => 3, 3, 3, 5, 3, 3
    l_conn_keys = l.keys.select do |i|  # => [],   [0],  [0, 1], [],   [0],  [0, 1], [],   [0],  [0, 1], [],   ...
      i < j and seq[i] < seq[j]         # => true, true, true,   true, true, true,   true, true, true,   true, ...
    end                                 # => [],   [0],  [0, 1], [],   [0],  [0, 1], [],   [0],  [0, 1], [],   ...

    l_conn_values = l_conn_keys.map { |k| seq[k] }  # => [], [1], [1, 2], [], [3], [3, 4], [], [1], [1, 3], [], ...

    l_conn_keys.each do |key|  # => [],    [0],   [0, 1], [],    [0],   [0, 1], [],    [0],   [0, 1], [],    ...
      l[key] = false           # => false, false, false,  false, false, false,  false, false, false,  false, ...
    end                        # => [],    [0],   [0, 1], [],    [0],   [0, 1], [],    [0],   [0, 1], [],    ...

    l[j] = l_conn_values ? l_conn_values.push(seq[j]) : [seq[j]]  # => [1], [1, 2], [1, 2, 4], [3], [3, 4], [3, 4, 7], [1], [1, 3], [1, 3, 5], [10], ...
  end                                                             # => 3, 3, 3, 5, 3, 3
  
  return l.select { |k,v| v != false }  # => {2=>[1, 2, 4]}, {2=>[3, 4, 7]}, {2=>[1, 3, 5]}, {2=>[10, 20, 30], 4=>[1, 2]}, {2=>[1, 2, 4]}, {2=>[3, 4, 7]}
end                                     # => :incr_subseq

incr_subseq([1, 2, 4])           # => {2=>[1, 2, 4]}
incr_subseq([3, 4, 7])           # => {2=>[3, 4, 7]}
incr_subseq([1, 3, 5])           # => {2=>[1, 3, 5]}
incr_subseq([10, 20, 30, 1, 2])  # => {2=>[10, 20, 30], 4=>[1, 2]}

def jlis(seqA, seqB)
  isAs = incr_subseq(seqA)  # => {2=>[1, 2, 4]}
  isBs = incr_subseq(seqB)  # => {2=>[3, 4, 7]}

  result = []                                                  # => []
  isAs.values.each do |incr_subseqA|                           # => [[1, 2, 4]]
    isBs.values.each do |incr_subseqB|                         # => [[3, 4, 7]]
      incr_subseq = [incr_subseqA, incr_subseqB].flatten.sort# => [1, 2, 3, 4, 4, 7]
    end                                                        # => [[3, 4, 7]]
  end                                                          # => [[1, 2, 4]]
end                                                            # => :jlis

jlis([1, 2, 4], [3, 4, 7])  # => [[1, 2, 4]]
