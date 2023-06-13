class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = (spending_money.delete("$")).to_i
    @preferences = []
  end

  def add_preference(pref)
    @preferences.push(pref)
  end

  def tall_enough?(threshold)
    if @height >= threshold
      true
    else false
    end
  end

  def ride(cost)
    @spending_money -= cost
  end
end