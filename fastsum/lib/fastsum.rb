require "fastsum/version"
require "fastsum/jlis"

module Fastsum
  def self.fastsum(n = 1)
    if n == 1
      return 1
    end
    return fastsum(n - 1) + n 
  end

  class Node
    attr_reader :value
    attr_accessor :top_left, :top_right, :bottom_left, :bottom_right
    
    def initialize(value=nil)
      @value = value
      left = nil
      right = nil
    end

    def to_s
      if value == 'x'
        return "#{value}#{top_left}#{top_right}#{bottom_left}#{bottom_right}"
      else        
        return reverse
      end
    end

    def reverse
      if @value == 'w' 
        return 'b'
      else
        return 'w'
      end
    end
  end

  class Quadtree
    attr_accessor :root_node
    
    def initialize(root_value=nil)
      @root_node = root_value
    end

    def to_s
      return "#{root_node}"
    end
  end

  @@tree = Fastsum::Quadtree.new()
  
  def self.decompress(input)
    make_tree(input)

    if input == 'w' || input == 'b'
      return input
    end
    
    return decompress_node(@@tree.root_node)
  end

  def self.make_tree(input)

    if input[0] == 'w' || input[0] == 'b'
      @@tree.root_node = Node.new(input[0])
      return
    end

    node = Node.new(input[0])
    node.top_left = Node.new(input[1])
    node.top_right = Node.new(input[2])
    node.bottom_left = Node.new(input[3])
    node.bottom_right = Node.new(input[4])

    @@tree.root_node = node
  end

  def self.decompress_node(node)
    return "#{node}"
  end
end
