require_relative 'spec_helper'
require_relative '../exchange'
require_relative '../client'

describe Exchange do
  let(:exchange) {Exchange.new('GA Stock Exchange')}

  describe ".new" do
      it "creates an Exchange object" do
        expect(exchange).to_not eql nil
      end
  end

  describe "#name" do
    it "has a name" do
      expect(exchange.name).to_not eql nil
    end
  end

  describe "#clients" do
    it "has a collection of clients" do
      expect(exchange.clients).to_not eql nil
    end
    it "contains Client objects" do
      exchange.clients['bob'] = Client.new('bob')
      expect(exchange.clients['bob']).to be_a_kind_of(Client)
    end
  end

  describe ".add_client" do
    it "adds a client to the exchange" do
      count = exchange.clients.count
      exchange.add_client(Client.new('bob'))
      expect(exchange.clients.count).to eq count+1
    end
    it "takes a Client object as a parameter" do
      expect(exchange.add_client(Client.new('bob'))).to be_a_kind_of(Client)
    end
  end

  describe ".delete_client" do
    it "deletes a client from the exchange" do
      exchange.clients['george'] = Client.new('george')
      count = exchange.clients.count
      exchange.delete_client('george')
      expect(exchange.clients.count).to eq count-1
    end

    it "expects a String type as parameter" do
      name = 'george'
      exchange.clients[name] = Client.new('george')
      exchange.delete_client(name)
      expect(name).to be_a_kind_of(String)
    end

  end

  describe ".display_clients" do
    it "shows a list of the exchange's clients" do
      exchange.clients['bob'] = Client.new('bob')
      exchange.clients['sue'] = Client.new('sue')
      exchange.clients['jen'] = Client.new('jen')
      expect(exchange.display_clients).to be_a_kind_of(String)
    end
  end

end