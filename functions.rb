def menu
  system('clear')
  40.times { print "*"}
  puts "\nWelcome to General Assembly Stock Exchange"
  40.times { print "*"}
  puts "\nPlease make a selection below, or (Q)uit."
  puts "(1)  Create an Account"
  puts "(2)  Add a Portfolio"
  puts "(3)  View a Portfolio"
  puts "(4)  View All of My Portfolios"
  puts "(5)  View all Clients"
  puts "(6)  View My Account Balance"
  puts "(7)  Check Stock Price"
  puts "(8)  Buy or Sell Stock"
  print "-> "
  gets.chomp
end

def create_account
  print "What is your first name? "
  name = gets.chomp
  print "What will be your starting balance? "
  balance = gets.to_f
  print "Name your first portfolio."
  portfolio = gets.chomp
  $exchange.clients[name] = Client.new(name,balance,{portfolio=>Portfolio.new(portfolio)})
  puts "Account created for #{name} with a $#{balance} starting balance and #{portfolio} portfolio."
  print "Press Enter to Continue..."
  gets
end

def add_portfolio
  print "What is your first name? "
  name = gets.chomp
  return if check_if_account_exists?(name) == false
  print "Name of your portfolio (one word): "
  new_portfolio = gets.chomp
  $exchange.clients[name].portfolios[new_portfolio] = Portfolio.new
  puts "#{new_portfolio} portfolio created for #{name}."
  print "Press Enter to Continue..."
  gets
end

def view_portfolio
end

def view_all_portfolios
end

def view_all_clients
  puts "Client List of #{$exchange.name}: "
  puts $exchange.clients.keys.join(', ')
  puts "Press Enter to Continue..."
  gets
end

def view_account_balance
  print "What is your first name? "
  name = gets.chomp
  return if check_if_account_exists?(name) == false
  balance = $exchange.clients[name].balance
  puts "#{name}'s account balance is #{balance}."
  puts "Press Enter to Continue..."
  gets
end

def purchase_or_sell_stock
  print "(B)uy or (S)ell Stock: "
  resp = gets.chomp.upcase
  case resp
  when "B" then buy_stock
  when "S" then sell_stock
  else
    "Error: Press Enter to Continue..."
    gets
  end
end

def buy_stock
  print "What is your name? "
  name = gets.chomp
  return if check_if_account_exists?(name) == false
  print "Which portfolio would you like to enter this into? "
  $exchange.clients[name].display_portfolios
  portfolio = gets.chomp
  print "Please enter the stock symbol: "
  stock = gets.chomp
  price = $exchange.clients[name].check_stock_price(stock)
  print "#{stock} costs #{price} per share. How many would you like to purchase? "
  num_shares = gets.to_i
  if $exchange.clients[name].buy(stock, num_shares, price, portfolio) != false
    puts "#{num_shares} shares of #{stock} purchased."
  else
    puts "Insufficient funds. 0 shares purchased."
  end
  puts "#{$exchange.clients[name]}'s balance: #{$exchange.clients[name].balance}"
  puts "Press Enter to Continue..."
  gets
end

def sell_stock
end

def view_stock_price
  print "What is your first name? "
  name = gets.chomp
  return if check_if_account_exists?(name) == false
  print "Please enter the stock symbol: "
  stock = gets.chomp
  price = $exchange.clients[name].check_stock_price(stock)
  puts "#{stock} costs #{price}."
  puts "Press Enter to Continue..."
  gets
end

def check_if_account_exists?(name)
  if !$exchange.clients.include?(name)
    print "#{name} not listed. Create an account? y/n: "
    resp = gets.chomp
    resp.downcase == 'y' ? create_account : false
  end
end

def menu_error
  puts "Invalid Entry: Please Enter to continue"
end

