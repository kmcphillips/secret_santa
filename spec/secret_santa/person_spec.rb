require "spec_helper"

describe SecretSanta::Person do
  let(:exchange){ SecretSanta::Exchange.new }
  let(:person) do
    p = SecretSanta::Person.new
    exchange.add_person p
    p
  end

  describe "#to_hash" do
    let(:person){ SecretSanta::Person.new(name: name, email: email, id: id, recipient: recipient) }
    let(:name){ "Fin T. Human" }
    let(:email){ "fin@oonet.com" }
    let(:id){ 123 }
    let(:recipient){ {name: "Jake T. Dog"} }

    it "should serialize the object to a hash" do
      pending
      expect(person.to_hash).to eq(name: name, email: email, id: id, recipient: recipient.inspect)
    end
  end
end
