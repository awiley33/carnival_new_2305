class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement

  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]

  end
end