require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

desc "Run the ruby console using pry and loading the secret santa dev environment"
task :console do 
  require 'pry'
  require 'secret_santa'
  require 'secret_santa/models'
  pry
end
