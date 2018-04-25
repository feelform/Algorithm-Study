module Fastsum
  class JLIS
  
    def initialize(a, b)
      @a = a
      @b = b

      @caches[0..a.length][0..b.length] = -1
    end
  
    def jlis(indexA, indexB)
      length = @caches[indexA + 1][indexB + 1]
      
      if length != -1
        return length
      end

      length = 2

      maxElement = []
      return length
    end
  end
  
end
