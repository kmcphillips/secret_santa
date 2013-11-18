require "spec_helper"

describe SecretSanta do
  describe "self#generate" do
    it "should raise if called without a block" do
      expect(->{ SecretSanta.generate }).to raise_error(SecretSanta::ConfigurationError)
    end

    it "should yield and return an exchange object" do
      expect(SecretSanta.generate{}).to be_an_instance_of(SecretSanta::Exchange)
    end
  end
end
