def linear_search(array, key)
  if array.index(key).nil?                        # => false
    return -1
  else
    return "#{key} at index #{array.index(key)}"  # => "3 at index 6"
  end
end                                               # => :linear_search

arr = [7, 6, 25, 19, 8, 14, 3, 16, 2, 0]  # => [7, 6, 25, 19, 8, 14, 3, 16, 2, 0]
key = 3                                   # => 3
p linear_search(arr, key)                 # => "3 at index 6"

# >> "3 at index 6"

