require 'pry'
require 'pry-debugger'
require 'rainbow'
require 'yahoofinance'
require_relative 'functions'
require_relative 'data'

response = menu
while response.downcase != 'q'
  case response
  when '1' then create_account
  when '2' then add_portfolio
  when '3' then ## call function
  when '4' then ## call function
  when '5' then view_all_clients
  when '6' then view_account_balance
  when '7' then view_stock_price
  when '8' then purchase_or_sell_stock
  else menu_error
  end
  response = menu
end
puts "Bye."