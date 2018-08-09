
def contain?(point)
  index = $sorted_nerds.bsearch_index {|pi| point["pi"] < pi }
  if $sorted_nerds.length == 0 || index == nil
    return false
  end

  $sorted_nerds[index..-1].select {|pi| point["qi"] < $nerds[pi]}.length > 0
end

def add(point)
  $nerds[point["pi"]] = point["qi"]

  index = 0
  if $sorted_nerds.length > 0
    index = $sorted_nerds.index {|pi| pi > point["pi"] }
    index = index == nil ? $sorted_nerds.length : index
  end
  $sorted_nerds.insert(index, point["pi"])
end

def remove(point) 
  index = $sorted_nerds.bsearch_index {|pi|
    (point["pi"] > pi && point["qi"] > $nerds[pi])
  }

  if index == nil
    return
  end

  pi = $sorted_nerds.delete_at(index)
  $nerds.delete(pi)
end

def join(point)
  if contain?(point)
    return $nerds.length()
  end

  remove(point)
  add(point)
  
  $sum += $nerds.length
end

def run()
  gets.to_i.times { |i|
    $nerds = {}
    $sorted_nerds = []
    $sum = 0
    
    gets.to_i.times { |j|
      point = gets.split.map(&:to_i)
      join({ "pi" => point[0], "qi" => point[1]})
    }

    puts $sum
  }
end

run()


=begin
$nerds = {}                      # => {}
$sorted_nerds = []               # => []
$sum = 0                         # => 0
join({ "pi" => 72, "qi" => 50})  # => 1
join({ "pi" => 57, "qi" => 67})  # => 3
join({ "pi" => 74, "qi" => 55})  # => 5
join({ "pi" => 64, "qi" => 60})  # => 8

$nerds = {}                    # => {}
$sorted_nerds = []             # => []
$sum = 0                       # => 0
join({ "pi" => 1, "qi" => 5})  # => 1
join({ "pi" => 2, "qi" => 4})  # => 3
join({ "pi" => 3, "qi" => 3})  # => 6
join({ "pi" => 4, "qi" => 2})  # => 10
join({ "pi" => 5, "qi" => 1})  # => 15
=end



