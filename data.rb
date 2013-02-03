require_relative 'exchange'
require_relative 'client'
require_relative 'portfolio'

$exchange = Exchange.new('General Assembly Stock Exchange')

$exchange.clients['Bob'] = Client.new('Bob',100.00)
$exchange.clients['Sue'] = Client.new('Bob',100.00)
$exchange.clients['George'] = Client.new('Bob',100.00)
$exchange.clients['Jen'] = Client.new('Bob',100.00)

$exchange.clients['Bob'].portfolios['tech'] = Portfolio.new
$exchange.clients['Bob'].portfolios['tech'].shares['AAPL'] = 100
$exchange.clients['Bob'].portfolios['tech'].shares['AMZN'] = 20
$exchange.clients['Bob'].portfolios['tech'].shares['MSFT'] = 500

$exchange.clients['Bob'].portfolios['bank'].shares['USBANK'] = 100

$exchange.clients['Bob'].portfolios['energy'].shares['GE'] = 100
$exchange.clients['Bob'].portfolios['energy'].shares['SolarWinds'] = 500






