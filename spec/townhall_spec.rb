require_relative '../lib/townhall'

describe townhall do 
  it "should be equal to 200" do
    expect(townhall.size).to eq(185)
  end
  it "should be an array" do
    expect(townhall).to be_an_instance_of(Array)
  end
  it "should be an hash" do
    expect(townhall[0]).to be_an_instance_of(Hash)
  end
end

