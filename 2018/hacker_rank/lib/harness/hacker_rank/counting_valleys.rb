module Harness
  module HackerRank
    class CountingValleys
      attr_accessor :binary_path

      def initialize(path: path)
        @path = path
        @binary_path = []
      end



      def valleys
        @path.split('').inject(0) do |altitude, step|
          if step == "D"
            walk_down
            altitude -= 1
            track_sea_level(altitude)
          else
            walk_up
            altitude += 1
            track_sea_level(altitude)
          end
          altitude
        end
        calculate_valleys
      end

    private

    def calculate_valleys
      binary_path.join.split('0').reject { |n| n[0] == "1"}.count
    end

    def walk_down
      binary_path.push(-1)
    end

    def walk_up
      binary_path.push(1)
    end

    def track_sea_level(sea_level)
      if sea_level == 0
          binary_path.push(0)
        end
      end
    end
  end
end