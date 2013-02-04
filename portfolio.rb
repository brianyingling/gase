require_relative "stock"

class Portfolio
  attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
  end

  def to_s
    "#{@name} has #{stocks.count} stocks in it"
  end

  def stock_list
    puts @stocks.values
  end

  def portfolio_val
    total = 0
    @stocks.each do |i|
      price = @stocks[i[0]].total_stock_val
      total = total + price
    end
    puts total
  end

end