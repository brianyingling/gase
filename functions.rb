def menu
  system('clear')
  40.times { print "*".color(:blue)}
  puts "\nWelcome to General Assembly Stock Exchange".color(:blue)
  40.times { print "*".color(:blue)}
  puts "\nPlease make a selection below, or (Q)uit.".color(:cyan)
  puts "(1)  Create an Account".color(:cyan)
  puts "(2)  Add a Portfolio".color(:cyan)
  puts "(3)  View a Portfolio".color(:cyan)
  puts "(4)  View All of My Portfolios".color(:cyan)
  puts "(5)  View all Clients".color(:cyan)
  puts "(6)  View My Account Balance".color(:cyan)
  puts "(7)  Check Stock Price".color(:cyan)
  puts "(8)  Buy or Sell Stock".color(:cyan)
  puts "(9)  Make a depost".color(:cyan)
  puts "(10) Make a withdrawal".color(:cyan)
  print "-> "
  gets.chomp
end

def create_account
  print "What is your first name? "
  name = gets.chomp
  print "What will be your starting balance? "
  balance = gets.to_f
  $exchange.clients[name] = Client.new(name,balance)
  puts "Account created for #{name} with a $#{balance} starting balance."
  print "Press Enter to Continue... "
  gets
end

def add_portfolio
  print "What is your first name? "
  name = gets.chomp
  return "You do not currently have an account. Please make an account before you add portfolios." if check_if_account_exists?(name) == false
  print "Name of your portfolio (one word): "
  new_portfolio = gets.chomp
  $exchange.clients[name].portfolios[new_portfolio] = Portfolio.new(new_portfolio)
  puts "#{new_portfolio} portfolio created for #{name}."
  print "Press Enter to Continue... "
  gets
end

def view_portfolio
  print "What is your first name? "
  name = gets.chomp
  print "What is the name of the portfolio? "
  port_name = gets.chomp
  if !$exchange.clients[name].portfolios.include? port_name
    puts "The portfolio #{port_name} does not currently exist. Please add it before you view it."
  else
    puts "#{port_name} contains #{$exchange.clients[name].portfolios[port_name].stocks.count}:"
    $exchange.clients[name].portfolios[port_name].stock_list
    puts "The total value of #{port_name} is $#{$exchange.clients[name].portfolios[port_name].portfolio_val}"
  end
  print "Press Enter to Continue... "
  gets
end

def view_all_portfolios
  print "What is your first name? "
  name = gets.chomp
  $exchange.clients[name].portfolio_list
  print "Press Enter to Continue... "
  gets
end

def view_all_clients
  puts "Client List of #{$exchange.name}: "
  puts $exchange.clients.values
  puts "Press Enter to Continue... "
  gets
end

def view_account_balance
  print "What is your first name? "
  name = gets.chomp
  return "You do not currently have an account. Please make one before you view balance" if check_if_account_exists?(name) == false
  balance = $exchange.clients[name].balance
  puts "#{name}'s account balance is #{balance}."
  puts "Press Enter to Continue... "
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
  return "You do not currently have an account. Please make one before you buy stock" if check_if_account_exists?(name) == false
  puts "Which portfolio would you like to enter this into? "
  $exchange.clients[name].portfolio_list
  portfolio = gets.chomp
  print "Please enter the stock symbol: "
  stock = gets.chomp
  price = $exchange.clients[name].check_stock_price(stock)
  print "#{stock} costs #{price} per share. How many would you like to purchase? "
  num_shares = gets.to_i
  # if $exchange.clients[name].buy(stock, num_shares, price, portfolio) != false
  #   puts "#{num_shares} shares of #{stock} purchased."
  # else
  #   puts "Insufficient funds. 0 shares purchased."
  # end
  $exchange.clients[name].buy(stock, num_shares, portfolio)
  puts "#{$exchange.clients[name]}'s balance: #{$exchange.clients[name].balance}" unless $exchange.clients[name].buy(stock, num_shares, portfolio).class == String
  puts "Press Enter to Continue..."
  gets
end

def sell_stock
  print "What is your name? "
  name = gets.chomp
  return "You do not currently have an account. Please make one before you buy stock" if check_if_account_exists?(name) == false

  $exchange.clients[name].portfolio_list
  puts "Which portfolio would you like to enter this into? "
  portfolio = gets.chomp
  print "Please enter the stock symbol: "
  stock = gets.chomp
  price = $exchange.clients[name].check_stock_price(stock)
  print "#{stock} costs #{price} per share. How many would you like to sell? "
  num_shares = gets.to_i
  $exchange.clients[name].sell(stock, num_shares, portfolio)
  puts "#{$exchange.clients[name]}'s balance: #{$exchange.clients[name].balance}" unless $exchange.clients[name].sell(stock, num_shares, portfolio).class == String
  puts "Press Enter to Continue..."
  gets
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

def make_deposit
  print "What is your first name? "
  name = gets.chomp
  return if check_if_account_exists?(name) == false
  print "How much would you like to deposit? "
  deposit = gets.to_f
  $exchange.clients[name].deposit(deposit)
  puts "#{deposit} has been added to your account. Your new balance is #{$exchange.clients[name].balance}"
  puts "Press Enter to Continue..."
  gets
end

def make_withdrawal
  print "What is your first name? "
  name = gets.chomp
  return if check_if_account_exists?(name) == false
  print "How much would you like to withdraw? "
  withdraw = gets.to_f
  $exchange.clients[name].withdraw(withdraw)
  puts "#{withdraw} has been subtracted from your account. Your new balance is #{$exchange.clients[name].balance}"
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

