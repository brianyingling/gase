require_relative 'spec_helper'
require_relative '../client'

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

  describe "#account" do
    it "has an account" do
      expect(client.account).to_not eql nil
    end
  end

  describe "#balance" do
    it "checks account balance" do
      client.account = 100.0
      expect(client.account).to eq 100.0
    end
  end

  describe "#withdraw" do
    it "withdraws from account" do
      client.account = 100.0
      client.withdraw(50.0)
      expect(client.account).to eq 50.0
    end

    it "ignores account withdrawal if larger than balance" do
      client.account = 100.0
      client.withdraw(500.0)
      expect(client.account).to eq 100.0
    end
  end

  describe "#deposit" do
    it "deposits amount into account" do
      client.account = 100.0
      client.deposit(100.0)
      expect(client.account).to eq 200.0
    end
  end
end