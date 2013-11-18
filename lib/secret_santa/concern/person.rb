module SecretSanta::Concern
  module Person
    extend ActiveSupport::Concern

    included do
    end

    def exceptions
      @exceptions ||= []
    end

    def add_exception(exception)
      exceptions << exception
    end

    def to_hash
      {
        name: name,
        email: email,
        id: id,
        recipient: recipient.inspect
      }
    end

    def ids
      [name, id, email].map(&:to_s).reject(&:blank?)
    end

    module ClassMethods
    end
  end
end
