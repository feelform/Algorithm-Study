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
  l = {0 => [[seq[0]]]}  # => {0=>[[1]]}
  
  seq.length.times do |j|                # => 4
    l_conn_keys = l.keys.select do |i|   # => [0],   [0],      [0, 1]
      i < j and l[i].all? { |container|  # => [[1]], [[1, 6]], [[[1, 6]]]
        container.all? { |element|       # => [1],   [1, 6],   [[1, 6]]
          element < seq[j]               # ~> NoMethodError: undefined method `<' for [1, 6]:Array
        }                                # => true, false
      }                                  # => false, true, false
    end                                  # => [], [0]

    l_conn_values = l_conn_keys.map { |key|  # => [], [0]
      value = nil                            # => nil
      l[key].each { |element|                # => [[1]]
        value = Array.new(element)           # => [1]
        element.push(seq[j])                 # => [1, 6]
      }                                      # => [[1, 6]]
    }                                        # => [], [[[1, 6]]]
    

   if l_conn_values.length > 0  # => false, true
     l[j] = l_conn_values       # => [[[1, 6]]]
   end                          # => nil, [[[1, 6]]]
  end
  
  return l.select { |k,v| v != false }
end                                     # => :incr_subseq

incr_subseq([1, 6, 3, 11])
#incr_subseq([1, 2, 2, 4, 4])     # => {3=>[1, 2, 4], 4=>[1, 2, 4]}
#incr_subseq([3, 4, 7])           # => {2=>[3, 4, 7]}
#incr_subseq([1, 3, 5])           # => {2=>[1, 3, 5]}
#incr_subseq([10, 20, 30, 1, 2])  # => {2=>[10, 20, 30], 4=>[1, 2]}

def jlis(seqA, seqB)
  isAs = incr_subseq(seqA)
  isBs = incr_subseq(seqB)

  results = []
  isAs.values.each do |incr_subseqA|
    isBs.values.each do |incr_subseqB|
      values =  incr_subseq([incr_subseqA, incr_subseqB].flatten.sort).values
      lengths = values.map { |k| k.length }
      results += lengths
    end
  end

  results.max
end

#jlis([1, 2, 4], [3, 4, 7])              # => 5
#jlis([1, 2, 3], [4, 5, 6])              # => 6
#jlis([10, 20, 30, 1, 2], [10, 20, 30])  # => 5

# ~> NoMethodError
# ~> undefined method `<' for [1, 6]:Array
# ~>
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:27:in `block (4 levels) in incr_subseq'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:26:in `each'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:26:in `all?'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:26:in `block (3 levels) in incr_subseq'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:25:in `each'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:25:in `all?'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:25:in `block (2 levels) in incr_subseq'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:24:in `select'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:24:in `block in incr_subseq'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:23:in `times'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:23:in `incr_subseq'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180502-15230-9mxufy/program.rb:49:in `<main>'


