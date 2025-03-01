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
    if rider.preferences.include?(@excitement) && rider.tall_enough?(@min_height)
      @rider_log[rider] += 1
      rider.ride(@admission_fee)
      @total_revenue += @admission_fee
    end
  end

  def ride_count
    @rider_log.values.sum
  end
end