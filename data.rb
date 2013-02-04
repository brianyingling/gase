require 'pry'
require 'pry-debugger'

require_relative 'exchange'
require_relative 'client'
require_relative 'portfolio'
require_relative "Stock"

$exchange = Exchange.new('General Assembly Stock Exchange')

$exchange.clients['Bob'] = Client.new('Bob',10000.00)
$exchange.clients['Sue'] = Client.new('Bob',100.00)
$exchange.clients['George'] = Client.new('Bob',100.00)
$exchange.clients['Jen'] = Client.new('Bob',100.00)

$exchange.clients['Bob'].portfolios['tech'] = Portfolio.new("tech")
$exchange.clients['Bob'].portfolios['tech'].stocks['AAPL'] = Stock.new("AAPL", 2)
$exchange.clients['Bob'].portfolios['tech'].stocks['AMZN'] = Stock.new("AMZN", 3)
$exchange.clients['Bob'].portfolios['tech'].stocks['MSFT'] = Stock.new("MSFT", 4)

$exchange.clients['Bob'].portfolios['bank'] = Portfolio.new("bank")
$exchange.clients['Bob'].portfolios['bank'].stocks['BOA'] = Stock.new("BAC", 5)

$exchange.clients['Bob'].portfolios['energy'] = Portfolio.new("energy")
$exchange.clients['Bob'].portfolios['energy'].stocks['GE'] = Stock.new("GE", 6)
$exchange.clients['Bob'].portfolios['energy'].stocks['SWI'] = Stock.new("SWI", 7)






