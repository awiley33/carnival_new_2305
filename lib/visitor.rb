class Visitor
  attr_reader :name,
              :height

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
  end

  def spending_money
    (@spending_money.delete("$")).to_i
  end
end