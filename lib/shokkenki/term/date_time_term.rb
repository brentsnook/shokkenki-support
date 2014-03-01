require_relative 'term'

module Shokkenki
  module Term
    class DateTimeTerm < Term

      attr_reader :type, :value

      def self.from_json json
        new DateTime.parse(json[:value])
      end

      def initialize value
        @value = value.to_datetime
        @type = :date_time
      end

      def to_hash
        {
          :type => @type,
          :value => @value
        }
      end

      def example
        @value
      end

      def match? compare
        return false unless compare
        datecompare = compare.respond_to?(:to_datetime) ? compare.to_datetime : DateTime.parse(compare.to_s)
        datecompare == @value
      end
    end
  end
end