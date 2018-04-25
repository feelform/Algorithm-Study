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
  l = {}              # => {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, ...
  
  seq.length.times do |j|               # => 5,    3,    3,      5,         3,            3,    6,    3,      3,    6,     ...
    l_conn_keys = l.keys.select do |i|  # => [],   [0],  [0, 1], [0, 1, 2], [0, 1, 2, 3], [],   [0],  [0, 1], [],   [0],   ...
      i < j and seq[i] < seq[j]         # => true, true, false,  true,      true,         true, true, true,   true, false, ...
    end                                 # => [],   [0],  [0],    [0, 1, 2], [0, 1, 2],    [],   [0],  [0, 1], [],   [0],   ...

    l_conn_values = l_conn_keys.map { |k| seq[k] }.uniq  # => [], [1], [1], [1, 2], [1, 2], [], [3], [3, 4], [], [1], ...

    l_conn_keys.each do |key|  # => [],    [0],   [0],   [0, 1, 2], [0, 1, 2], [],    [0],   [0, 1], [],    [0],   ...
      l[key] = false           # => false, false, false, false,     false,     false, false, false,  false, false, ...
    end                        # => [],    [0],   [0],   [0, 1, 2], [0, 1, 2], [],    [0],   [0, 1], [],    [0],   ...

    l[j] = l_conn_values ? l_conn_values.push(seq[j]) : [seq[j]]  # => [1], [1, 2], [1, 2], [1, 2, 4], [1, 2, 4], [3], [3, 4], [3, 4, 7], [1], [1, 3], ...
  end                                                             # => 5,   3,      3,      5,         3,         3,   6,      3,         3,   6,      ...
  
  return l.select { |k,v| v != false }  # => {3=>[1, 2, 4], 4=>[1, 2, 4]}, {2=>[3, 4, 7]}, {2=>[1, 3, 5]}, {2=>[10, 20, 30], 4=>[1, 2]}, {2=>[1, 2, 4]}, {2=>[3, 4, 7]}, {5=>[1, 2, 3, 4, 7]}, {2=>[1, 2, 3]}, {2=>[4, 5, 6]}, {5=>[1, 2, 3, 4, 5, 6]}, ...
end                                     # => :incr_subseq

incr_subseq([1, 2, 2, 4, 4])     # => {3=>[1, 2, 4], 4=>[1, 2, 4]}
incr_subseq([3, 4, 7])           # => {2=>[3, 4, 7]}
incr_subseq([1, 3, 5])           # => {2=>[1, 3, 5]}
incr_subseq([10, 20, 30, 1, 2])  # => {2=>[10, 20, 30], 4=>[1, 2]}

def jlis(seqA, seqB)
  isAs = incr_subseq(seqA)  # => {2=>[1, 2, 4]}, {2=>[1, 2, 3]}, {2=>[10, 20, 30], 4=>[1, 2]}
  isBs = incr_subseq(seqB)  # => {2=>[3, 4, 7]}, {2=>[4, 5, 6]}, {2=>[10, 20, 30]}

  results = []                                                                 # => [],          [],          []
  isAs.values.each do |incr_subseqA|                                           # => [[1, 2, 4]], [[1, 2, 3]], [[10, 20, 30], [1, 2]]
    isBs.values.each do |incr_subseqB|                                         # => [[3, 4, 7]],       [[4, 5, 6]],          [[10, 20, 30]],               [[10, 20, 30]]
      values =  incr_subseq([incr_subseqA, incr_subseqB].flatten.sort).values  # => [[1, 2, 3, 4, 7]], [[1, 2, 3, 4, 5, 6]], [[10, 20, 30], [10, 20, 30]], [[1, 2, 10, 20, 30]]
      lengths = values.map { |k| k.length }                                    # => [5],               [6],                  [3, 3],                       [5]
      results += lengths                                                       # => [5],               [6],                  [3, 3],                       [3, 3, 5]
    end                                                                        # => [[3, 4, 7]],       [[4, 5, 6]],          [[10, 20, 30]],               [[10, 20, 30]]
  end                                                                          # => [[1, 2, 4]], [[1, 2, 3]], [[10, 20, 30], [1, 2]]

  results.max  # => 5, 6, 5
end            # => :jlis

jlis([1, 2, 4], [3, 4, 7])              # => 5
jlis([1, 2, 3], [4, 5, 6])              # => 6
jlis([10, 20, 30, 1, 2], [10, 20, 30])  # => 5
