class Portfolio
  attr_accessor :name, :stocks
  def initialize(name="default")
    @stocks = {}
    @name = name
  end
  def to_s
    "Stocks: #{@stocks}"
  end
end
