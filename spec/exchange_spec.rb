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
end