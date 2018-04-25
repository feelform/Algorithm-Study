#!/usr/bin/ruby

RSpec.describe "JLIS" do
  it "A = (1 2 4) B = (3 4 7)" do
    expect(Fastsum::JLIS.new([1, 2, 4], [3, 4, 7]).jlis(0, 0)).to eq(5)
  end
end
