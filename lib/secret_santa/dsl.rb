class SecretSanta::Dsl
  class << self

    def generate(&block)
      @exchange = SecretSanta::Exchange.new
      instance_eval(&block)
      @exchange
    end

    def title(title_string)
      @exchange.title = title_string
    end

    def add_person(name, opts={})
      # TODO
    end

    def person
      # TODO
    end

  end
end
