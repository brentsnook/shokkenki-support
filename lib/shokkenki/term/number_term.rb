require_relative 'term'

module Shokkenki
  module Term
    class NumberTerm < Term

      def self.type; :number; end

      def self.from_json json
        new json[:value]
      end

      def initialize value
        @value = value
      end

      def to_hash
        {
          :type => type,
          :value => @value
        }
      end

      def example
        @value
      end

      def match? compare
        compare && (compare == @value)
      end
    end
  end
end