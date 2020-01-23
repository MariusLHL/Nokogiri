require '../lib/dark_trader'

describe coinmarket do 
  it "should be equal to 200" do
    expect(coinmarket.size).to eq(200)
  end
  it "should be equal to Bitcoin" do
    expect(coinmarket[0]).to include("Bitcoin")
  end
  it "should be equal to ETH" do
    expect(coinmarket[1]).to include("Ethereum")
  end
  it "should be equal to Bitcoin" do
    expect(coinmarket[198]).to include("ZTCoin")
  end
  it "should be an instance of array" do
    expect(coinmarket).to be_an_instance_of(Array)
  end
  it "should be an instance of Hash" do
    expect(coinmarket[0]).to be_an_instance_of(Hash)
  end
end

