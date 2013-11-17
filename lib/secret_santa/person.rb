class SecretSanta::Person
  # include ActiveModel::Model
  include SecretSanta::Concern::Person

  attr_accessor :name, :email, :id, :recipient
end
