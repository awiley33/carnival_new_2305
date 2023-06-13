class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides.push(ride)
  end

  def most_popular_ride
    @rides.max_by { |ride| ride.ride_count}
  end

  def most_profitable_ride
    @rides.max_by { |ride| ride.total_revenue}
  end

  def total_revenue
    @rides.sum do |ride|
      ride.total_revenue
    end
  end
end