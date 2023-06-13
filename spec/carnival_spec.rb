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

  it "can tell us its most popular ride" do
    @carnival1.add_ride(@ride1)
    @carnival1.add_ride(@ride2)
    @carnival1.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)

    expect(@carnival1.most_popular_ride).to eq(@ride1)
  end

  it "can tell us its most profitable ride" do
    @carnival1.add_ride(@ride1)
    @carnival1.add_ride(@ride2)
    @carnival1.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)

    @ride1.board_rider(@visitor1) 
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride2.board_rider(@visitor2)
    
    expect(@carnival1.most_profitable_ride).to eq(@ride2)
  end

  it "can calculate the total revenue from all its rides" do
    @carnival1.add_ride(@ride1)
    @carnival1.add_ride(@ride2)
    @carnival1.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)

    @ride1.board_rider(@visitor1) 
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride2.board_rider(@visitor2)

    expect(@carnival1.total_revenue).to eq(13)
  end

  it "can provide a summary hash" do
    @carnival1.add_ride(@ride1)
    @carnival1.add_ride(@ride2)
    @carnival1.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)

    @ride1.board_rider(@visitor1) 
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor2)

    expected = {
      visitor_count: 3,
      revenue_earned: 18,
      visitors: [
        {
          visitor: @visitor1,
          favorite_ride: @ride1,
          total_money_spent: 3
        },
        {
          visitor: @visitor2,
          favorite_ride: @ride2,
          total_money_spent: 11
        },
        {
          visitor: @visitor3,
          favorite_ride: @ride3,
          total_money_spent: 4
        }],
      rides: [
        {
          ride: @ride1,
          riders: [@visitor1, @visitor2],
          total_revenue: 4
        },
        {
          ride: @ride2,
          riders: [@visitor2],
          total_revenue: 10
        },
        {
          ride: @ride3,
          riders: [@visitor3],
          total_revenue: 4
        }]
    }
  end

end