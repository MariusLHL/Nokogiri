require_relative '../lib/dark_trader'

describe coinmarket do 
  it "should be equal to 200" do
    expect(coinmarket.size).to eq(200)
  end
  it "should be equal to Bitcoin" do
    expect(coinmarket.to_s).to include("BTC")
  end
  it "should be equal to ETH" do
    expect(coinmarket.to_s).to include("ETH")
  end
  it "should be equal to Bitcoin" do
    expect(coinmarket.to_s).to include("XMR")
  end
  it "should be an instance of array" do
    expect(coinmarket).to be_an_instance_of(Array)
  end
  it "should be an instance of Hash" do
    expect(coinmarket[0]).to be_an_instance_of(Hash)
  end
end

