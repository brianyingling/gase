require 'pry'
require 'pry-debugger'

require_relative 'exchange'
require_relative 'client'
require_relative 'portfolio'

$exchange = Exchange.new('General Assembly Stock Exchange')

$exchange.clients['Bob'] = Client.new('Bob',100.00)
$exchange.clients['Sue'] = Client.new('Bob',100.00)
$exchange.clients['George'] = Client.new('Bob',100.00)
$exchange.clients['Jen'] = Client.new('Bob',100.00)

$exchange.clients['Bob'].portfolios['tech'] = Portfolio.new
$exchange.clients['Bob'].portfolios['tech'].stocks['AAPL'] = 100
$exchange.clients['Bob'].portfolios['tech'].stocks['AMZN'] = 20
$exchange.clients['Bob'].portfolios['tech'].stocks['MSFT'] = 500

$exchange.clients['Bob'].portfolios['bank'] = Portfolio.new
$exchange.clients['Bob'].portfolios['bank'].stocks['USBANK'] = 100

$exchange.clients['Bob'].portfolios['energy'] = Portfolio.new
$exchange.clients['Bob'].portfolios['energy'].stocks['GE'] = 100
$exchange.clients['Bob'].portfolios['energy'].stocks['SolarWinds'] = 500






