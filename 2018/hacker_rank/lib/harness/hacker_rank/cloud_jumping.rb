module Harness
  module HackerRank
    class CloudJumping

      def initialize(clouds=[])
        @clouds = clouds
      end

      def run
        walk(@clouds).length
      end

       def walk(clouds)
        skip_next = false
        memo = []
        steps(clouds).each do |i|
          if skip_next == true
            skip_next = false
            next
          else
            if i == 2
              memo << i
              skip_next = true
            else
              memo << i if i == 1
              skip_next = false
            end
          end
        end
        memo
      end

      def steps(clouds)
        moves = []
        clouds.each_with_index do |cloud_type, sky|
          if cloud_type == cumulus
            if clouds[sky + 2] == cumulus
              moves << double_jump
            elsif clouds[sky + 2] == finish_line
              moves << no_jump
            elsif clouds[sky + 1] == cumulus
              require 'pry'; binding.pry
              moves << single_jump
            elsif clouds[sky + 1] == finish_line
              require 'pry'; binding.pry
              moves << single_jump
            else
              moves << single_jump
            end
          else
            moves << no_jump
          end
        end
        moves
      end


      def cumulus
        0
      end

      def finish_line
        nil
      end

      def double_jump
        2
      end

      def single_jump
        1
      end

      def no_jump
        0
      end
    end
  end
end