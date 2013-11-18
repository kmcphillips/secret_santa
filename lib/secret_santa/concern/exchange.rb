module SecretSanta::Concern
  module Exchange
    extend ActiveSupport::Concern

    included do
    end

    def people
      @people ||= Set.new
    end

    def add_person(person)
      people << person
    end
    alias_method :<<, :add_person

    def add_exception(person_id, exception_id)
      # TODO
    end

    def matched?
      !!matched_at
    end

    def match!
      raise SecretSanta::MatchingError, "Match has already been completed." if matched?
      # TODO
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
