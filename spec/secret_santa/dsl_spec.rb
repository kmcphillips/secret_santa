require "spec_helper"

describe SecretSanta::Dsl do
  
  describe "#title" do
    it "should set the title on the new exchange" do
      exchange = SecretSanta::Dsl.generate{ title("The title") }
      expect(exchange.title).to eq("The title")
    end
  end  

  describe "#add_person" do
    it "should create a person with the passed in args" do
      exchange = SecretSanta::Dsl.generate{ add_person("name", email: "email", id: 123, name: "do not override") }
      expect(exchange.people.size).to eq(1)
      expect(exchange.people.first.name).to eq("name")
      expect(exchange.people.first.email).to eq("email")
      expect(exchange.people.first.id).to eq(123)
    end
  end

end
