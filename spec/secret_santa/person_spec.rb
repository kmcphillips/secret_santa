require "spec_helper"

describe SecretSanta::Person do
  let(:exchange){ SecretSanta::Exchange.new }
  let(:person) do
    p = SecretSanta::Person.new
    exchange.add_person p
    p
  end


end
