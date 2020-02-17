module Harness
  module HackerRank
    class RepeatedString
      def initialize(string:, repeat:)
        @string = string
        @repeat = repeat.to_i
        make_string
      end

      def total
        a_in_range.select do |a|
          a == 'a'
        end.count
      end

    private

    def a_in_range
      @infinity[0..@repeat].split('')
    end

    def make_string
      @infinity = ''
      @repeat.times do |s|
        @infinity << @string
      end
    end

    end
  end
end