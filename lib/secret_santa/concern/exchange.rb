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
      find_person!(person_id).add_exception(find_person!(exception_id))
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

    def find_person(id)
      people.each do |person|
        return person if person.ids.include?(id.to_s)
      end
      nil
    end

    def find_person!(id)
      find_person(id) || raise(SecretSanta::MatchingError, "Could not find person by '#{ id }'")
    end

    module ClassMethods
    end
  end
end
