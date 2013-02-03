require_relative 'spec_helper'
require_relative '../client'
require_relative '../portfolio'
require_relative '../stock'
require_relative '../exchange'

describe Client do
  let(:client) {Client.new('Bob')}

  describe ".new" do
    it "creates a Client object" do
      expect(client).to_not eq nil
    end
  end

  describe "#name" do
    it "has a name" do
    expect(client.name).to_not eq nil
    end
  end

  describe "#balance" do
    it "has an balance" do
      expect(client.balance).to_not eql nil
    end
  end

  describe "#balance" do
    it "checks balance balance" do
      client.balance = 100.0
      expect(client.balance).to eq 100.0
    end
  end

  describe "#withdraw" do
    it "withdraws from balance" do
      client.balance = 100.0
      client.withdraw(50.0)
      expect(client.balance).to eq 50.0
    end

    it "ignores balance withdrawal if larger than balance" do
      client.balance = 100.0
      client.withdraw(500.0)
      expect(client.balance).to eq 100.0
    end
  end

  describe "#deposit" do
    it "deposits amount into balance" do
      client.balance = 100.0
      client.deposit(100.0)
      expect(client.balance).to eq 200.0
    end
  end

  describe "#portfolios" do
    it "contains Portfolio objects" do
      expect(client.portfolios).to_not eql nil
      client.portfolios['tech'] = Portfolio.new
      expect(client.portfolios['tech']).to be_a_kind_of(Portfolio)
    end
  end

  describe ".create_portfolio" do
    it "creates a portfolio" do
      client.create_portfolio('tech',Portfolio.new)
      expect(client.portfolios['tech'])
    end
    it "receives a String parameter as its name" do
      client.create_portfolio('tech', Portfolio.new)
      client.portfolios.keys.count.times do |i|
        expect(client.portfolios.keys[i]).to be_a_kind_of(String)
      end
    end
  end

  describe ".delete_portfolio" do
      it "deletes a portfolio" do
        client.create_portfolio('tech', Portfolio.new)
        client.delete_portfolio('tech')
        expect(client.portfolios['tech']).to eq nil
      end
      it "receives a String as a parameter" do
        name = 'tech'
        client.create_portfolio(name, Portfolio.new)
        client.delete_portfolio(name)
        expect(name).to be_a_kind_of(String)
      end
  end

  describe ".display_portfolios" do
    it "lists the portfolios owned by the client" do
      client.create_portfolio('tech', Portfolio.new)
      client.create_portfolio('energy', Portfolio.new)
      client.portfolios['tech'].stocks['ibm'] = 100
      client.portfolios['tech'].stocks['msft'] =250
      client.portfolios['energy'].stocks['ge'] = 100
      expect(client.display_portfolios).to be_a_kind_of(String)
    end
  end

  describe ".buy" do
    it "purchases stock" do
      client.create_portfolio('tech', Portfolio.new)
      client.buy('AAPL', 200, 100.0,'tech')
      client.portfolios['tech'].stocks['AAPL'] = 200
      expect(client.portfolios['tech'].stocks['AAPL'] = 200)
    end

    it "ignores if client can't afford stock" do
      client.create_portfolio('tech', Portfolio.new)
      client.portfolios['tech'].stocks['AAPL'] = 50
      client.buy('AAPL', 200, 100.0,'tech')
      expect(client.portfolios['tech'].stocks['AAPL']).to eq 50
    end
  end

  describe ".sell" do
    it "sells stock" do
      client.create_portfolio('tech',Portfolio.new)
      client.portfolios['tech'].stocks['AAPL'] = 50
      client.sell('AAPL',50,50,'tech')
      expect(client.portfolios['tech'].stocks['AAPL']).to eq 0
    end
    it "ignores if shares held are less than shares offered." do
      client.create_portfolio('tech',Portfolio.new)
      client.portfolios['tech'].stocks['AAPL'] = 50
      client.sell('AAPL',100,50,'tech')
      expect(client.portfolios['tech'].stocks['AAPL']).to eq 50
    end
  end
end