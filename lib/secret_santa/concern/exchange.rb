module SecretSanta::Concern
  module Exchange
    extend ActiveSupport::Concern

    included do
    end

    def matched?
      !!matched_at
    end

    module ClassMethods
    end
  end
end
