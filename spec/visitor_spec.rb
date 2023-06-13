require "spec_helper"


describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end


  it "exists and has readable attributes" do
    expect(@visitor1).to be_a Visitor
    expect(@visitor1.name).to eq("Bruce")
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq(10)
  end

  it "starts with an empty preferences array and can add preferences" do
    expect(@visitor1.preferences).to eq([])
    
    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)
    
    expect(@visitor1.preferences).to eq([:gentle, :thrilling])
  end
end