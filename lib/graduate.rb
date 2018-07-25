

FRUIT = { 1 => 'Orange', 2 => 'Banana', 4 => 'Cherry', 8 => 'Apple' }

def mask_fruit(a, b)
  a | b
end

def unmask_fruit(masked)
  FRUIT.select { |k, _| (masked | k) == masked }
end

mask = mask_fruit 1, 8
unmask_fruit mask

INF = 999999

def bit_count(value)
  value.to_s(2).chars.select { |one| one == '1' }.size
end

def graduate(semester, taken)
  if bit_count(semester) >= K
    return taken
  end

  if taken >= M
    return  INF
  end

  value = INF

  
end

N = 4
K = 4
M = 4
L = 4
graduate(10, 1)


N = 5
graduate(11, 2)

bit_count(1)
bit_count(2)
bit_count(3)
bit_count(5)
bit_count(6)
bit_count(7)
