module SecretSanta::Concern
  module Person
    extend ActiveSupport::Concern

    included do
      attr_reader :exceptions
    end

    def add_exception(exception)
      @exceptions ||= [] # TODO refactor up to initialize
      @exceptions << exception
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
