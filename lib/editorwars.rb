class EditorWars

  def initialize(x)
    @parent = Array.new(x) {|i| i}    # => [0, 1, 2, 3]
    @enemies = Array.new(x) {|i| -1}  # => [-1, -1, -1, -1]
  end                                 # => :initialize

  def find(x)
    return x if @parent[x] == x    # => true, true, true, true, true, true, true, true
    @parent[x] = find(@parent[x])
  end                              # => :find

  def union(a, b)
    return [a, b].max if a == -1 || b== -1  # => false, true, false, true
    @parent[find(a)] = @parent[find(b)]     # => 1, 2
  end                                       # => :union

  def sets
    @parent.collect{ |i| find(i) }.uniq.length
  end                                           # => :sets

  def add(happy, a, b)
    if happy == "ACK"   # => true, true, false
      if !ack(a, b)     # => false, false
        
      end            # => nil, nil
    else
      if !dis(a, b)  # ~> NoMethodError: undefined method `dis' for #<EditorWars:0x00007fafdb944a48>
       
      end
    end    # => nil, nil
  end      # => :add

  def ack(a, b)
    friend_a = find(a)  # => 0, 1
    friend_b = find(b)  # => 1, 2

    return false if @enemies[a] == b  # => false, false
    
    friend = union(friend_a, friend_b)                     # => 1,    2
    enemy = union(@enemies[friend_a], @enemies[friend_b])  # => -1,   -1
    @enemies[friend] = enemy                               # => -1,   -1
    @enemies[enemy] = friend if enemy != -1                # => nil,  nil
    return true                                            # => true, true
  end                                                      # => :ack
end                                                        # => :ack

wars = EditorWars.new(4)  # => #<EditorWars:0x00007fafdb944a48 @parent=[0, 1, 2, 3], @enemies=[-1, -1, -1, -1]>
wars.add("ACK", 0, 1)     # => nil
wars.add("ACK", 1, 2)     # => nil
wars.add("DIS", 1, 3)
wars.add("ACK", 2, 0)

# ~> NoMethodError
# ~> undefined method `dis' for #<EditorWars:0x00007fafdb944a48>
# ~>
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180905-4682-90pzmx/program.rb:28:in `add'
# ~> /var/folders/2p/wqc2mfzx69bfpxdq9r82wkv40000gn/T/seeing_is_believing_temp_dir20180905-4682-90pzmx/program.rb:51:in `<main>'
