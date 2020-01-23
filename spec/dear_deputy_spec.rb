require_relative '../lib/dear_deputy'

describe deputy do 
  it "should be equal to 577" do
    expect(deputy.size).to eq(577)
  end
  it "should be an array" do
    expect(deputy).to be_an_instance_of(Array)
  end
  it "should be an hash" do
    expect(deputy[0]).to be_an_instance_of(Hash)
  end
  it "shouldn't include nil or empty values" do
    expect(deputy).not_to include(nil)
  end  
end