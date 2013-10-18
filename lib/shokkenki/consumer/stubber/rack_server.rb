require 'shokkenki/consumer/stubber/interactions'
require 'shokkenki/consumer/stubber/interactions_middleware'
require 'shokkenki/consumer/stubber/stubbed_response_middleware'

module Shokkenki
  module Consumer
    module Stubber
      class RackServer

        def initialize
          @interactions = Interactions.new
          @interactions_middleware = InteractionsMiddleware.new @interactions
          @stubbed_response_middleware = StubbedResponseMiddleware.new @interactions
        end

        def call env
          handler = env['PATH_INFO'].match(%r{^/shokkenki/}) ? @interactions_middleware : @stubbed_response_middleware
          handler.call env
        end
      end
    end
  end
end