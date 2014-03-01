require 'shokkenki/term/string_term'
require_relative 'hash_term'
require_relative 'regexp_term'
require_relative 'number_term'
require_relative 'json_paths_term'
require_relative 'date_term'
require_relative 'date_time_term'
require 'active_support/core_ext/hash/keys'

module Shokkenki
  module Term
    class TermFactory

      def self.factories
        @factories ||= [
          StringTerm, HashTerm, RegexpTerm, NumberTerm, JsonPathsTerm, DateTerm, DateTimeTerm
          ].inject({}) do |h, term|
            h[term.type] = term
            h
          end
      end

      def self.factory_for type
        raise 'There is no term type' unless type
        factories[type.to_s.downcase.to_sym] || raise("Term of type '#{type}' is not recognised. Have you registered a factory for it?")
      end

      def self.register type, factory
        factories[type.to_s.downcase.to_sym] = factory
      end

      def self.from_json json
        symbolized_json = json.symbolize_keys
        factory_for(symbolized_json[:type]).from_json symbolized_json
      end
    end
  end
end