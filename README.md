# Secret Santa

**This gem is a work in progress and doesn't actually work yet. Be patient.**

Setup and build secret gift exchanges. This tool lets you build a set of participants in a gift exchange and randomly map them to oneanother. It prevents deadlocks. It allows the administrator to be a part of the exchange without seeing the output. It allows for exceptions if you do not want two people to ever be matched together.


## For the impatient

TODO: You'll have to be patient for now


## Installation

Add this line to your application's Gemfile:

    gem 'secret_santa'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install secret_santa


## Dependencies

* ActiveSupport ~> 4.0.1
* ActiveModel ~> 4.0.1


## Usage

### Simplest case: Built in models

This gem provides some `ActiveModel` compliant models to work with. Simply include them as they are not required by default:

    require 'secret_santa/models'


### Define a simple exchange with the DSL

Because this is ruby, there is a handy DSL to build a simple exchange. It will setup the models for you. Example:

```ruby
ooo_exchange = SecretSanta.generate do
  title "Land of Ooo Gift Exchange"

  add_person "Fin the Human", email: "humanfin@ooonet.com"
  add_person "Jake the Dog", email: "webmaster@jakeontheinternet.net"
  add_person "Princess Bubblegum", email: "pb@candykingdom.com"

  person("Fin the Human").will_not_receive("Jake the Dog")
end
```

Exceptions may be added with the following types:

* will_not_give_to: Person on the left will not draw the name of the person on the right.
* will_not_receive_from: Person on the left will not have their name drawn by the person on the right.
* will_not_exchange_with: Neither person will draw one another.


### Define an exchange using the built in models

If you don't like DSLs or want to define your exchange in a more OO way the same above example translates to:

```ruby
ooo_exchange = SecretSanta::Exchange.new(title: "Land of Ooo Gift Exchange")
ooo_exchange.add_person SecretSanta::Person.new(name: "Fin the Human", email: "humanfin@ooonet.com")
ooo_exchange.add_person SecretSanta::Person.new(name: "Jake the Dog", email: "webmaster@jakeontheinternet.net")
ooo_exchange.add_person SecretSanta::Person.new(name: "Princess Bubblegum", email: "pb@candykingdom.com")
ooo_exchange.add_exception("Fin the Human", "Jake the Dog")

```


### Performing the match

Once you have built out your exchange, perform the match. It can only be done once and will raise a `SecretSanta::MatchingError` if it is called a second time:

```ruby
> ooo_exchange.match!
true
```

It uses a fail-retry algorithm for deadlocks. Turns out, secret santa matching is actually a relatively hard problem. But the data sets are small so this system works fine.

It only really breaks down if you are too restrictive with your excaptions and the problem is unsolvable. In that case it will retry N times and if it fails all N times it will raise a `SecretSanta::MatchingError` explaining so.


### Match information

Each person model will now reference the other person they have been matched with and should be giving a gift:

```ruby
person = ooo_exchange.people.first
person.name # "Princess Bubblegum"
person.recipient # "Fin the Human"

```

It will also appear in the serialization methods as `to_json` or `to_hash`.


### Email

TODO: implement emailing


### Building your own models

If you have existing models or some more complex requirement, you can use your own models rather than the built in ones. The important logic is in modules. Simply do not include the models as above, define your own models, and then include the concerns into them.

```ruby
class YourAwesomeNamespace::SuperPerson
  include SecretSanta::Concern::Person
  attr_accessor :name, :email, :id, :recipient
end

class YourAwesomeNamespace::SuperExchange
  include SecretSanta::Concern::Exchange
  attr_accessor :title, :matched_at
end

```

TODO: Configure the gem to recognize these models for the DSL.


## Ruby on Rails and ActiveRecord models

Want to use this gem with rails? It'll work fine for now, but Rails and ActiveRecord integration is coming.


## Other frameworks, DBs, or ORMs

This gem tries to be as generic as possible. I'm sure it will work with few modifications with your cutting edge framework or web-scale database of choice.


## Contributing

Please do.

http://github.com/kmcphillips/secret_santa

## Credits

Written by [Kevin McPhillips](http://github.com/kmcphillips). Developer at [Shopify](http://shopify.com/careers).
