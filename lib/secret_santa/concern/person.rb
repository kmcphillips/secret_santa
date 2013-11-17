module SecretSanta::Concern
  module Person
    extend ActiveSupport::Concern

    included do
    end

    def to_hash
      {
        name: name,
        email: email,
        id: id,
        recipient: recipient.inspect
      }
    end

    module ClassMethods
    end
  end
end
