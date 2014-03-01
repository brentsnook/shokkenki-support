require_relative 'term'
require 'date'

module Shokkenki
  module Term
    class DateTerm < Term

      attr_reader :type, :value

      def self.from_json json
        new Date.parse(json[:value])
      end

      def initialize value
        @value = value.to_date
        @type = :date
      end

      def to_hash
        {
          :type => @type,
          :value => @value.iso8601
        }
      end

      def example
        @value
      end

      def match? compare
        return false unless compare
        datecompare = compare.respond_to?(:to_date) ? compare.to_date : Date.parse(compare.to_s)
        datecompare == @value
      end
    end
  end
end