require "spec_helper"

describe SecretSanta::Exchange do
  let(:exchange){ SecretSanta::Exchange.new }

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
end