
def create_post_order(inorder, root)
  if $preorder.empty? || inorder.empty?
    return
  end

  root = $preorder.delete_at(0)

  root_index = inorder.index(root)

  left = inorder.slice(0, root_index)
  right = inorder[root_index+1..-1]

  create_post_order(left, root)
  create_post_order(right, root)

  $postorder.push(root)
end

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

=begin
$preorder = [27, 16, 9, 12, 54, 36, 72]
inorder = [9, 12, 16, 27, 36, 54, 72]
$postorder = []

create_post_order(inorder, 0)

$preorder = [409, 479, 10, 838, 150, 441]
inorder = [409, 10, 479, 150, 838, 441]
$postorder = []

create_post_order(inorder, 0)
=end



