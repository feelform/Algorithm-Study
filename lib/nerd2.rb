
def contain?(point)
  $sorted_nerds.bsearch {|pi| point["pi"] < pi && point["qi"] < $nerds[pi]} != nil
end

def add(point)
  $nerds[point["pi"]] = point["qi"]

  index = $sorted_nerds.bsearch_index {|pi| pi > point["pi"]}
  if index != nil
    $sorted_nerds.insert(index, point["pi"])
  else
    $sorted_nerds.push(point["pi"])
  end
  
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
    return $sorted_nerds.length
  end

  remove(point)
  add(point)
  
  $sum += $sorted_nerds.length
end

def run()
  gets.to_i.times {
    $nerds = {}
    $sorted_nerds = []
    $sum = 0
    
    gets.to_i.times {
      point = gets.split.map(&:to_i)
      join({"pi" => point[0], "qi" => point[1]})
    }

    puts $sum
  }
end

run()



$nerds = {}
$sorted_nerds = []
$sum = 0
join({ "pi" => 72, "qi" => 50})
join({ "pi" => 57, "qi" => 67})
join({ "pi" => 74, "qi" => 55})
join({ "pi" => 64, "qi" => 60})


$nerds = {}
$sorted_nerds = []
$sum = 0
join({ "pi" => 1, "qi" => 5})
join({ "pi" => 2, "qi" => 4})
join({ "pi" => 3, "qi" => 3})
join({ "pi" => 4, "qi" => 2})
join({ "pi" => 5, "qi" => 1})


