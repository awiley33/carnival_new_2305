require 'spec_helper'



describe Carnival do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @carnival1 = Carnival.new(14)
  end

  it "exists and has readable attributes" do
    expect(@carnival1).to be_a Carnival
    expect(@carnival1.duration).to eq(14)
    expect(@carnival1.rides).to eq([])
  end

  it "starts with an empty rides array and can add rides" do
    expect(@carnival1.rides).to eq([])

    @carnival1.add_ride(@ride1)
    @carnival1.add_ride(@ride2)
    @carnival1.add_ride(@ride3)

    expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
  end

end