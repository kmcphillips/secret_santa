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
      # TODO
    end

    module ClassMethods
    end
  end
end
