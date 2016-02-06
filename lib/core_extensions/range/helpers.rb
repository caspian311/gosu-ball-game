module CoreExtensions
  module Range
    module Helpers
      def overlaps?(other)
        (to_a & other.to_a).any?
      end
    end
  end
end

Range.include CoreExtensions::Range::Helpers
