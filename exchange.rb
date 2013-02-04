require 'pry'
require 'pry-debugger'
require_relative 'client'

class Exchange
  attr_accessor :name, :clients
  def initialize(name)
    @name = name
    @clients = {}
  end

  def add_client(client)
    @clients[client.name] = client
  end

  def delete_client(client)
    @clients.delete(client)
  end

  def display_clients
    puts @clients.values
  end

  def to_s
    "Welcome to the #{name} Stock Exchange"
  end
end

