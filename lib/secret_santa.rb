require 'active_support/concern'
require 'active_support/core_ext'
require 'active_model'
require 'set'

require 'secret_santa'
require 'secret_santa/version'
require 'secret_santa/errors'
require 'secret_santa/dsl'
require 'secret_santa/concern/person'
require 'secret_santa/concern/exchange'

module SecretSanta
  def self.generate(&block)
    raise SecretSanta::ConfigurationError, "#generate must be called with a block" unless block_given?
    SecretSanta::Dsl.generate(&block)
  end
end
