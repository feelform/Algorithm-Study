require "set"

def contain?(point)
  point["pi"]
  $sorted_nerds
  index = $sorted_nerds.bsearch_index {|pi| point["pi"] < pi }
  if $sorted_nerds.length == 0 || index == nil
    return false
  end

  $nerds
  point["qi"]
  $nerds.select {|key, value| point["qi"] < value} ? 
end

def join(point)
  if contain?(point)
    return $nerds.length()
  end
  
  $nerds[point["pi"]] = point["qi"]

  index = 0
  if $sorted_nerds.length > 0
    index = $sorted_nerds.index {|pi| pi > point["pi"] }
    index = index == nil ? $sorted_nerds.length : index
  end
  $sorted_nerds.insert(index, point["pi"])

  $nerds.length
end

$nerds = {}
$sorted_nerds = []
join({ "pi" => 72, "qi" => 50})
join({ "pi" => 57, "qi" => 67})
join({ "pi" => 74, "qi" => 55})
join({ "pi" => 64, "qi" => 60})
