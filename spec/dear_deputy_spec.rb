require_relative '../lib/dear_deputy'

describe deputy do 
  it "should be equal to 577" do
    expect(deputy.size).to eq(576)
  end
  it "should be an array and an hash" do
    expect(deputy).to be_an_instance_of(Array)
    expect(deputy[0]).to be_an_instance_of(Hash)
  end
  it "shouldn't include nil or empty values" do
    expect(deputy).not_to include(nil)
  end  
end