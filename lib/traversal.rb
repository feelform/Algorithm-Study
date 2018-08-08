
def create_post_order(inorder, root)
  if $preorder.empty? || inorder.empty?  # => false, false, false, true, false, true, true, true, false, false, ...
    return
  end

  root = $preorder.delete_at(0)  # => 27, 16, 9, 12, 54, 36, 72, 409, 479, 10, ...

  root_index = inorder.index(root)  # => 3, 2, 0, 0, 1, 0, 0, 0, 1, 0, ...

  left = inorder.slice(0, root_index)  # => [9, 12, 16],  [9, 12], [],   [], [36], [], [], [],                       [10],            [], ...
  right = inorder[root_index+1..-1]    # => [36, 54, 72], [],      [12], [], [72], [], [], [10, 479, 150, 838, 441], [150, 838, 441], [], ...

  create_post_order(left, root)   # => nil, nil,  [12, 9], [12, 9, 16], nil, [12, 9, 16, 36],     nil,                     nil, nil, [10], ...
  create_post_order(right, root)  # => nil, [12], nil,     nil,         nil, [12, 9, 16, 36, 72], [12, 9, 16, 36, 72, 54], nil, nil, nil,  ...

  $postorder.push(root)  # => [12], [12, 9], [12, 9, 16], [12, 9, 16, 36], [12, 9, 16, 36, 72], [12, 9, 16, 36, 72, 54], [12, 9, 16, 36, 72, 54, 27], [10], [10, 150], [10, 150, 441], ...
end                      # => :create_post_order

=begin
def run()
  gets.to_i.times { |i|
    gets
    $preorder = gets.split.map(&:to_i)
    inorder = gets.split.map(&:to_i)
    $postorder = []
    create_post_order(inorder, 0)
    puts $postorder.join(' ')
  }
end

run()
=end

$preorder = [27, 16, 9, 12, 54, 36, 72]  # => [27, 16, 9, 12, 54, 36, 72]
inorder = [9, 12, 16, 27, 36, 54, 72]    # => [9, 12, 16, 27, 36, 54, 72]
$postorder = []                          # => []

create_post_order(inorder, 0)  # => [12, 9, 16, 36, 72, 54, 27]

=begin
$preorder = [409, 479, 10, 838, 150, 441]  # => [409, 479, 10, 838, 150, 441]
inorder = [409, 10, 479, 150, 838, 441]    # => [409, 10, 479, 150, 838, 441]
$postorder = []                            # => []

create_post_order(inorder, 0)  # => [10, 150, 441, 838, 479, 409]
=end


