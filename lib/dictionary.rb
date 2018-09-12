=begin
void dfs(int here) {
    visited[here] = true;
    for (auto there : vt[here]) {
        if (!visited[there])
            dfs(there);
        else if (!finish[there])
            cycle = 1;
    }
    finish[here] = true;
    st.push(here);
}
=end

class Dictionary
  def initialize()
    @node = Array.new(26) {|i| Array.new(26) {|i| 0} }
    @works = Array.new
  end

  def add(word)
    @works.push word
  end

  def sort
    (@works.length - 1).times { |work_index|
      @works[work_index]
    }
  end
end

dictionary = Dictionary.new
dictionary.add("ba")
dictionary.add("aa")
dictionary.add("ab")
dictionary.sort()

