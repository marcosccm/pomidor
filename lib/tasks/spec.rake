require 'rspec/core/rake_task'

desc "run all specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end