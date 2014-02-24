require_relative 'ruby-string-random/lib/strrand'
require_relative 'term'

module Shokkenki
  module Term
    class RegexpTerm < Term

      attr_reader :type, :value

      def self.from_json json
        new json[:value]
      end

      def initialize value
        @value = Regexp.new value
        @type = :regexp
      end

      def to_hash
        {
          :type => @type,
          :value => @value.inspect
        }
      end

      def example
        StringRandom.random_regex @value.inspect
      end

      def match? compare
        compare && !@value.match(compare.to_s).nil?
      end
    end
  end
end