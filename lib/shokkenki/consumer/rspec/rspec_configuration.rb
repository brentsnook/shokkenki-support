require 'shokkenki/consumer/rspec/example_group_binding'
require 'rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include Shokkenki::Consumer::RSpec::ExampleGroupBinding

  config.before(:each, :shokkenki_consumer => lambda{ |x| true }) do
    Shokkenki::Consumer::Session.singleton.current_consumer = example.metadata[:shokkenki_consumer]
  end

  config.after(:suite) { Shokkenki::Consumer::Session.singleton.print_tickets }
end