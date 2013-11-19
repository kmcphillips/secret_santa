require "spec_helper"

describe SecretSanta::Exchange do
  let(:exchange){ SecretSanta::Exchange.new }
  let(:person){ double }

  describe "#people" do
    it "should have an empty collection of people" do
      expect(exchange.people.length).to be_zero
    end
  end

  describe "#add_person" do
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
    let(:person){ double }
    let(:exception){ double }
    let(:person_id){ "p" }
    let(:exception_id){ "e" }

    it "should add the exception to the person" do
      expect(exchange).to receive(:find_person!).with(person_id).and_return(person)
      expect(exchange).to receive(:find_person!).with(exception_id).and_return(exception)
      expect(person).to receive(:add_exception).with(exception).and_return(true)
      expect(exchange.add_exception(person_id, exception_id)).to be_true
    end
  end

  describe "#find_person" do
    it "should find the first person by id" do
      exchange << person
      allow(person).to receive(:ids).and_return(["123"])
      expect(exchange.find_person(123)).to eq(person)
    end

    it "should return nil if not found" do
      exchange << person
      allow(person).to receive(:ids).and_return([])
      expect(exchange.find_person(123)).to be_nil
    end

    it "should return the person if we are matching by object" do
      exchange << person
      allow(person).to receive(:ids).and_return([])
      expect(exchange.find_person(person)).to eq(person)
    end
  end

  describe "#find_person!" do
    it "should return the person from #find_person" do
      expect(exchange).to receive(:find_person).with("asdf").and_return(person)
      expect(exchange.find_person!("asdf")).to eq(person)
    end

    it "should raise if the person is not found" do
      expect(exchange).to receive(:find_person).with("asdf").and_return(nil)
      expect(->{ exchange.find_person!("asdf") }).to raise_error(SecretSanta::MatchingError)
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
