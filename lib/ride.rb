class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log,
              :total_revenue

  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]
    @rider_log = Hash.new(0)
    @total_revenue = 0
  end

  def board_rider(rider)
    @rider_log[rider] += 1
    rider.ride(@admission_fee)
  end
end