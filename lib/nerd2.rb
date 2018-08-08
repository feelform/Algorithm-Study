require "set"  # => true

def contain?(point)
  index = $sorted_nerds.bsearch_index {|pi| point["pi"] > pi }  # => nil,  nil,  0,     nil
  if index == nil                                               # => true, true, false, true
    return false                                                # => false, false, false
  end

  
end  # => :contain?

def join(point)
  if contain?(point)        # => false, false, nil, false
    return $nerds.length()
  end
  
  $nerds[point["pi"]] = point["qi"]  # => 50, 67, 55, 60

  index = 0                                               # => 0,     0,    0,    0
  if $sorted_nerds.length > 0                             # => false, true, true, true
    index = $sorted_nerds.index {|pi| pi > point["pi"] }  # => 0, nil, 1
    index = index == nil ? $sorted_nerds.length : index   # => 0, 2,   1
  end                                                     # => nil,  0,        2,            1
  $sorted_nerds.insert(index, point["pi"])                # => [72], [57, 72], [57, 72, 74], [57, 64, 72, 74]

  $nerds.length  # => 1, 2, 3, 4
end              # => :join

$nerds = {}                      # => {}
$sorted_nerds = []               # => []
join({ "pi" => 72, "qi" => 50})  # => 1
join({ "pi" => 57, "qi" => 67})  # => 2
join({ "pi" => 74, "qi" => 55})  # => 3
join({ "pi" => 64, "qi" => 60})  # => 4
