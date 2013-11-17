require 'pry'
require 'secret_santa'
require 'secret_santa/models' # Might pull this out and test this in isolation

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  # config.filter_run :focus
  config.order = 'random'
end
