

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
  
end  # => :graduate

"4 4 4 4".split.map(&:to_i)  # => [4, 4, 4, 4]

input_string = %{2
4 4 4 4
0
1 0
3 0 1 3
0
4 0 1 2 3 
4 0 1 2 3
3 0 1 3
4 0 1 2 3
4 2 2 4
1 1
0
1 3
1 2
3 0 2 3
3 1 2 3
}  # => "2\n4 4 4 4\n0\n1 0\n3 0 1 3\n0\n4 0 1 2 3 \n4 0 1 2 3\n3 0 1 3\n4 0 1 2 3\n4 2 2 4\n1 1\n0\n1 3\n1 2\n3 0 2 3\n3 1 2 3\n"

input_string.lines[0].to_i.times {  # => 2
  
}  # => 2

