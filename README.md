# Secret Santa

**Work in progress.**

Setup and build secret gift exchanges. This tool lets you build a set of participants in a gift exchange and randomly map them to oneanother. It prevents deadlocks. It allows the administrator to be a part of the exchange without seeing the output. It allows for exceptions if you do not want two people to ever be matched together.


## Dependencies

ActiveSupport ~> 4.0.1
ActiveModel ~> 4.0.1


## Installation

Add this line to your application's Gemfile:

    gem 'secret_santa'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install secret_santa


## Usage

This gem provides some `ActiveModel` compliant models to work with. Simply include them as they are not required by default:

    require 'secret_santa/models'

TODO: The rest of these docs


### With your own models

Simply do not include the models as above. Define your own models and include the concerns into them.

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


## Ruby on Rails and ActiveRecord models

Want to use this gem with rails? It'll work fine for now, but Rails and ActiveRecord integration is coming.


## Contributing

Please do.

http://github.com/kmcphillips/secret_santa

## Credits

Written by [Kevin McPhillips](http://github.com/kmcphillips), developer at [Shopify](http://shopify.com/careers).
