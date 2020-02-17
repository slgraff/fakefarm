module Battleship
  class Ship
    attr_accessor :type, :position, :direction, :length, :coordinates, :hits, :clear

    def initialize(config: {}, coordinates: [])
      @type = config[:type]
      @position = config[:position]
      @direction = config[:direction]
      @length = config[:length]
      @hits = []
      @clear = []
      @sunk = false
      @coordinates = coordinates
    end

    def status(coor)
      if ship_on_fire?(coor)
        :already_hit
      else
        report_damage(coor)
      end
    end


    def report_damage(coor)
      hits << coor
      @clear = coordinates - hits
      sunk? ? :sunk : :hit
    end

    def sunk?
      @sunk = if (coordinates - hits).empty?
        :sunk
      else
        false
      end
    end

    def access_damage(coor)
      report_damage(coor)
    end

    def ship_on_fire?(coor)
      hits.include?(coor)
    end
  end
end