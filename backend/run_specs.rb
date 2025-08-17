# run_specs.rb
require 'rspec/core'

# Run all specs inside the "spec" folder
exit RSpec::Core::Runner.run(['spec'])
