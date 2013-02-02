class Exchange
  attr_accessor :name, :clients
  def initialize(name)
    @name = name
    @clients = {}
  end
end