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

  describe "#person" do
    context "#will_not_give_to" do
      it "should add the exception" do
        exchange = SecretSanta::Dsl.generate do
          add_person "person1"
          add_person "person2"
          add_person "person3"
          person("person1").will_not_give_to("person2")
        end

        expect(exchange.find_person!("person1").exceptions.size).to eq(1)
        expect(exchange.find_person!("person2").exceptions.size).to eq(0)
        expect(exchange.find_person!("person3").exceptions.size).to eq(0)
      end
    end

    context "#will_not_receive_from" do
      it "should add the exception" do
        exchange = SecretSanta::Dsl.generate do
          add_person "person1"
          add_person "person2"
          add_person "person3"
          person("person1").will_not_receive_from("person2")
        end

        expect(exchange.find_person!("person1").exceptions.size).to eq(0)
        expect(exchange.find_person!("person2").exceptions.size).to eq(1)
        expect(exchange.find_person!("person3").exceptions.size).to eq(0)
      end
    end

    context "#will_not_exchange_with" do
      it "should add the exception" do
        exchange = SecretSanta::Dsl.generate do
          add_person "person1"
          add_person "person2"
          add_person "person3"
          person("person1").will_not_exchange_with("person2")
        end

        expect(exchange.find_person!("person1").exceptions.size).to eq(1)
        expect(exchange.find_person!("person2").exceptions.size).to eq(1)
        expect(exchange.find_person!("person3").exceptions.size).to eq(0)
      end
    end
  end
end
