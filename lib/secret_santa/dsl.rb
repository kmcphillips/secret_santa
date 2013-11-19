class SecretSanta::Dsl
  class << self

    def generate(&block)
      @exchange = SecretSanta::Exchange.new
      instance_eval(&block)
      @exchange
    end

    def title(title_string)
      @exchange.title = title_string
      nil
    end

    def add_person(name, opts={})
      @exchange << SecretSanta::Person.new(opts.merge(name: name))
      nil
    end

    def person(person_id)
      if person_id.is_a?(SecretSanta::Person)
        SecretSanta::Dsl::Person.new(person_id, @exchange)
      else
        SecretSanta::Dsl::Person.new(@exchange.find_person!(person_id), @exchange)
      end
    end

  end

  class Person
    attr_reader :person

    def initialize(person, exchange)
      @person = person
      @exchange = exchange
    end

    def will_not_give_to(exception)
      person.add_exception(@exchange.find_person!(exception))
    end

    def will_not_receive_from(exception)
      @exchange.find_person!(exception).add_exception(person)
    end

    def will_not_exchange_with(exception)
      exception_person = @exchange.find_person!(exception)

      person.add_exception(exception_person)
      exception_person.add_exception(person)
    end
  end
end
