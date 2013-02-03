require 'pry'
require 'pry-debugger'
require_relative 'portfolio'

class Client
  attr_accessor :name, :balance, :portfolios
  def initialize(name, balance=0.0, portfolios={})
    @name = name
    @balance = balance
    @portfolios = portfolios
  end

  def withdraw(amount)
    @balance -= amount if amount <= @balance
  end

  def deposit(amount)
    @balance += balance
  end

  def create_portfolio(name, portfolio)
    @portfolios[name] = portfolio
  end

  def delete_portfolio(name)
    @portfolios[name] = nil
  end

  def display_portfolios
    output = ""
    @portfolios.each do |name, portfolio|
      output += "#{name}\t: "
      portfolio.stocks.each do |stock, shares|
        output += "#{stock}: #{shares}\t"
      end
      output += "\n"
    end
    output
  end

  def buy(stock, shares, price, portfolio_name)
    return if @balance < shares*price
    self.withdraw(shares*price)
    if @portfolios[portfolio_name].stocks[stock]
      @portfolios[portfolio_name].stocks[stock] += shares
    else
      @portfolios[portfolio_name].stocks[stock] = shares
    end
  end

  def sell(stock, shares, price, portfolio_name)
    return if @portfolios[portfolio_name].stocks[stock] < shares
    self.deposit(shares*price)
    @portfolios[portfolio_name].stocks[stock] -= shares
  end

  def to_s
    "#{@name}"
  end
end


