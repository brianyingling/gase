class Stock
  attr_accessor :name, :shares
  def initialize(name, shares)
    @name = name
    @shares = shares
  end
end