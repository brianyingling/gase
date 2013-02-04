require "yahoofinance"

class Stock
  attr_accessor :name, :num_shares
  def initialize(name, num_shares)
    @name = name
    @num_shares = num_shares
  end

  def to_s
    "#{@name} costs $#{get_price(@name)} right now and #{@num_shares} shares are owned"
  end


  def get_price(name)
    begin
      YahooFinance::get_quotes(YahooFinance::StandardQuote, name)[name].lastTrade
    rescue
      retry
    end
  end

  def total_stock_val
    price = get_price(@name)
    total = price * @num_shares
  end


end
