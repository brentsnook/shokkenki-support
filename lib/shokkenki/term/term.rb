module Shokkenki
  module Term
    class Term

      attr_reader :value

      def type
        @@type
      end

      def to_shokkenki_term
        self
      end

      def type
        self.class.type
      end
    end
  end
end