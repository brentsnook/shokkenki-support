require_relative 'term'

module Shokkenki
  module Term
    class StringTerm < Term

      def self.type; :string; end

      def self.from_json json
        new json[:value]
      end

      def initialize value
        @value = value.to_s
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
        compare && (compare.strip == @value)
      end
    end
  end
end