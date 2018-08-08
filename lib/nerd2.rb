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
  index = $sorted_nerds.bsearch_index {|pi| point["pi"] < pi}

  if index == nil
    return
  end

  $sorted_nerds.slice(0, index)
  left_nerds = $sorted_nerds.slice(0, index).select {|pi| $nerds[pi] < point["qi"]}
end

def join(point)
  if contain?(point)
    return $nerds.length()
  end

  remove(point)
  add(point)
  
  $nerds.length
end

$nerds = {}
$sorted_nerds = []
join({ "pi" => 72, "qi" => 50})
join({ "pi" => 57, "qi" => 67})
join({ "pi" => 74, "qi" => 55})
join({ "pi" => 64, "qi" => 60})
