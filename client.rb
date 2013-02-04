require_relative 'portfolio'
require_relative "stock"

class Client
  attr_accessor :name, :balance, :portfolios

  def initialize(name, balance=0)
    @name = name
    @balance = balance
    @portfolios = {}
  end

# class Client
#   attr_accessor :name, :balance, :portfolios
#   def initialize(name, balance=0.0, portfolios={})
#     @name = name
#     @balance = balance
#     @portfolios = portfolios
#   end

  def withdraw(amount)
    @balance -= amount if amount <= @balance
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  # def create_portfolio(name, portfolio)
  #   @portfolios[name] = portfolio
  # end

  def delete_portfolio(name)
    @portfolios[name] = nil
  end

  # def display_portfolios
  #   output = ""
  #   @portfolios.each do |name, portfolio|
  #     output += "#{name}\n: "
  #     portfolio.stocks.each do |stock, shares|
  #       output += "#{stock}: #{shares}\n"
  #     end
  #     output += "\n"
  #   end
  #   output
  # end

  def portfolio_list
    @portfolios.each do |i|
      puts "#{@portfolios[i[0]]}:"
      puts @portfolios[i[0]].stock_list
    end
  end

  def total_port_val
    total = 0
    @portfolios.each do |i|
      price = @portfolios[i[0]].portfolio_val
      total = total + price
    end
    puts total
  end

  # def buy(stock, shares, price, portfolio_name)
  #   return puts "You do not have a high enough balance to complete this transaction. Please deposit more to continue." if @balance < shares*price
  #   self.withdraw(shares*price)
  #   if @portfolios[portfolio_name].stocks[stock]
  #     @portfolios[portfolio_name].stocks[stock] += shares
  #   else
  #     @portfolios[portfolio_name].stocks[stock] = shares
  #   end
  # end

  def buy(stock,shares,portfolio_name)
    new_stock = Stock.new(stock,shares)
    price = new_stock.total_stock_val
    return "You do not have enough in your account to complete this transaction. Please deposit #{price-@balance} to continue." if @balance < price
    if @portfolios[portfolio_name].stocks.include? stock
      old_shares = @portfolios[portfolio_name].stocks[stock].num_shares
      @portfolios[portfolio_name].stocks[stock].num_shares = old_shares + shares
    else
      @portfolios[portfolio_name].stocks[stock] = new_stock
    end
    @balance = @balance - price
  end

  # def sell(stock, shares, price, portfolio_name)
  #   return if @portfolios[portfolio_name].stocks[stock] < shares
  #   self.deposit(shares*price)
  #   @portfolios[portfolio_name].stocks[stock] -= shares
  # end

  def sell(stock,shares,portfolio_name)
    old_shares = @portfolios[portfolio_name].stocks[stock].num_shares
    return "You don't own that many shares. You only own #{old_shares} shares of #{stock}" if shares > old_shares
    return "You don't own any shares of #{stock}" unless @portfolios[portfolio_name].stocks.include? stock
    @portfolios[portfolio_name].stocks[stock].num_shares = old_shares - shares
    @balance = @balance + (@portfolios[portfolio_name].stocks[stock].get_price(stock))*shares
  end

  def check_stock_price(name)
    begin
      YahooFinance::get_quotes(YahooFinance::StandardQuote, name)[name].lastTrade
    rescue
      retry
    end
  end


  def to_s
    "#{@name} has #{@portfolios.count} portfolios."
  end
end





