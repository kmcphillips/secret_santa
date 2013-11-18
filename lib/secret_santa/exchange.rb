class SecretSanta::Exchange
  include ActiveModel::Model
  include SecretSanta::Concern::Exchange

  attr_accessor :title, :matched_at
end
