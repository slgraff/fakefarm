module Harness
  module HackerRank
    class SockMerchant
      attr_reader :pile

      def initialize(socks: , pile:)
        @socks = socks
        @pile = pile
      end

      def match
        last = nil;
        pile.sort.inject(0) do |memo, color|
          if color == last
            memo += 1
            last = nil
          else
            last = color
          end
          memo
        end
      end
    end
  end
end