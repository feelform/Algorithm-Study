

FRUIT = { 1 => 'Orange', 2 => 'Banana', 4 => 'Cherry', 8 => 'Apple' }  # => {1=>"Orange", 2=>"Banana", 4=>"Cherry", 8=>"Apple"}

def mask_fruit(a, b)
  a | b               # => 9
end                   # => :mask_fruit

def unmask_fruit(masked)
  FRUIT.select { |k, _| (masked | k) == masked }  # => {1=>"Orange", 8=>"Apple"}
end                                               # => :unmask_fruit

mask = mask_fruit 1, 8  # => 9
unmask_fruit mask       # => {1=>"Orange", 8=>"Apple"}

INF = 999999  # => 999999

def bit_count(value)
  value.to_s(2).chars.select { |one| one == '1' }.size  # => 2, 3, 1, 1, 2, 2, 2, 3
end                                                     # => :bit_count

def graduate(semester, taken)
  if bit_count(semester) >= K  # => false, false
    return taken
  end

  if taken >= M  # => false, false
    return  INF
  end

  value = INF  # => 999999, 999999

  
end  # => :graduate

N = 4            # => 4
K = 4            # => 4
M = 4            # => 4
L = 4            # => 4

graduate(10, 1)  # => 999999


N = 5            # => 5
graduate(11, 2)  # => 999999

bit_count(1)  # => 1
bit_count(2)  # => 1
bit_count(3)  # => 2
bit_count(5)  # => 2
bit_count(6)  # => 2
bit_count(7)  # => 3
