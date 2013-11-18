require "spec_helper"

describe SecretSanta::Exchange do
  let(:exchange){ SecretSanta::Exchange.new }

  describe "#people" do
    it "should have an empty collection of people" do
      expect(exchange.people.length).to be_zero
    end
  end

  describe "#add_person" do
    let(:person){ double }

    it "should append the passed in object to the collection" do
      expect(exchange.people.to_a).to eq([])
      exchange.add_person(person)
      expect(exchange.people.to_a).to eq([person])
    end

    it "should alias to :<< on the exchange instance" do
      expect(exchange.people.to_a).to eq([])
      exchange << person
      expect(exchange.people.to_a).to eq([person])
    end

    it "should not add a duplicate person" do
      expect(exchange.people.to_a).to eq([])
      exchange.add_person(person)
      exchange.add_person(person)
      expect(exchange.people.to_a).to eq([person])
    end
  end

  describe "#add_exception" do
    it "should be tested" do
      pending
    end
  end

  describe "#matched?" do
    it "should check the :matched_at column for true" do
      exchange.matched_at = Time.now
      expect(exchange.matched?).to be_true
    end

    it "should check the :matched_at column for false" do
      expect(exchange.matched?).to be_false
    end
  end

  describe "#match!" do
    it "should raise if it has already matched" do
      expect(exchange).to receive(:matched?).and_return(true)
      expect(->{ exchange.match! }).to raise_error(SecretSanta::MatchingError)
    end

  end

  describe "#to_hash" do
    let(:title){ "The exchange title" }
    let(:time){ Time.now }

    it "should generate a hash from values" do
      exchange.matched_at = time
      exchange.title = title
      expect(exchange.to_hash).to eq(title: title, matched_at: time)
    end
  end
end
