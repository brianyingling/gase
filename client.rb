class Client
  attr_accessor :name, :account
  def initialize(name)
    @name = name
    @account = 0.0
  end

  def withdraw(amount)
    @account -= amount if amount <= @account
  end

  def deposit(amount)
    @account += amount
  end

end