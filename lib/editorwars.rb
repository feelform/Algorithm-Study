class EditorWars

  def initialize(n)
    @parent = Array.new(n) {|i| i}
    @enemies = Array.new(n) {|i| -1}
    @ranks = Array.new(n) {|i| 0}
  end

  def find(x)
    return x if @parent[x] == x
    @parent[x] = find(@parent[x])
  end

  def union(a, b)
    return [a, b].max if a == -1 || b== -1

    friend_a = find(a)
    friend_b = find(b)

    return friend_a if friend_a == friend_b
    friend_a, friend_b = friend_b, friend_a if ranks[friend_a] > ranks[friend_b]

    
    @parent[find(a)] = @parent[find(b)]
  end

  def sets
    @parent.collect{ |i| find(i) }.uniq.length
  end

  def add(happy, a, b)
    if happy == "ACK"
      if !ack(a, b)
        
      end
    else
      if !dis(a, b)
       
      end
    end
  end

  def ack(a, b)
    friend_a = find(a)
    friend_b = find(b)

    return false if @enemies[a] == b
    
    friend = union(friend_a, friend_b)
    enemy = union(@enemies[friend_a], @enemies[friend_b])
    @enemies[friend] = enemy
    @enemies[enemy] = friend if enemy != -1
    return true
  end
end

wars = EditorWars.new(4)
wars.add("ACK", 0, 1)
wars.add("ACK", 1, 2)
wars.add("DIS", 1, 3)
wars.add("ACK", 2, 0)

def accepts_hash(var)
  
end

accepts_hash :arg1 => 'given arg1', :argN => 'giving argN'
