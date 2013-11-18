require "spec_helper"

describe SecretSanta::Person do
  let(:exchange){ SecretSanta::Exchange.new }
  let(:person) do
    p = SecretSanta::Person.new
    exchange.add_person p
    p
  end

  describe "#add_exception" do
    it "should add the exception to the collection" do
      expect(person.exceptions.length).to be_zero
      person.add_exception double
      person.add_exception "Princess Bubblegum"
      expect(person.exceptions.length).to eq(2)
    end
  end

  describe "#to_hash" do
    let(:person){ SecretSanta::Person.new(name: name, email: email, id: id, recipient: recipient) }
    let(:name){ "Fin T. Human" }
    let(:email){ "fin@ooonet.com" }
    let(:id){ 123 }
    let(:recipient){ {name: "Jake T. Dog"} }

    it "should serialize the object to a hash" do
      expect(person.to_hash).to eq(name: name, email: email, id: id, recipient: recipient.inspect)
    end
  end
end
