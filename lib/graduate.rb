

FRUIT = { 1 => 'Orange', 2 => 'Banana', 4 => 'Cherry', 8 => 'Apple' }  # => {1=>"Orange", 2=>"Banana", 4=>"Cherry", 8=>"Apple"}

def mask_fruit(a, b)
  a | b               # => 9
end                   # => :mask_fruit

def unmask_fruit(masked)
  FRUIT.select { |k, _| (masked | k) == masked }  # => {1=>"Orange", 8=>"Apple"}
end                                               # => :unmask_fruit

mask = mask_fruit 1, 8  # => 9
unmask_fruit mask       # => {1=>"Orange", 8=>"Apple"}


def graduate(semester, taken)
  N + 1                        # => 5, 6
end                            # => :graduate

N = 4  # => 4

graduate(10, 1)  # => 5


N = 5            # => 5
graduate(11, 2)  # => 6
