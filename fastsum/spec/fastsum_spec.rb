RSpec.describe Fastsum do
  it "n = 1" do
    expect(Fastsum.fastsum(1)).to eq(1)
  end

  it "n = 2" do
    expect(Fastsum.fastsum(2)).to eq(3)
  end

  it "n = 3" do
    expect(Fastsum.fastsum(3)).to eq(6)
  end

  context "Quardtree class" do
    it "input w" do
      expect(Fastsum.decompress("w")).to eq("w")
    end

    it "input xbwwb" do
      expect(Fastsum.decompress("xbwwb")).to eq("xwbbw")
    end
  end
end
