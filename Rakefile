require './app'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: [Rake::Task["db:test:prepare"], :spec]
