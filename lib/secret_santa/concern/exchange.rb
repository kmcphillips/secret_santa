module SecretSanta::Concern
  module Exchange
    extend ActiveSupport::Concern

    included do
    end

    def people
      @people ||= Set.new # TODO: Refactor up when activemodel stuff is fixed
      @people.to_a
    end

    def add_person(person)
      @people << person
    end
    alias_method :<<, :add_person

    def matched?
      !!matched_at
    end

    def match!
      raise SecretSanta::MatchingError, "Match has already been completed." if matched?

    end

    def to_hash
      {
        title: title,
        matched_at: matched_at
      }
    end

    module ClassMethods
    end
  end
end
