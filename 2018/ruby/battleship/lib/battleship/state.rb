module Battleship
  class State
    attr_accessor :store
    attr_reader :board, :ship_log, :ships

    def initialize(board=Board, ships: :ships, ship: Ship)
      @ships = ships
      @ship_log = {}
      @board = board
      @ship = ship
    end

    def log_ships
      @ships.map { |ship| add_ship(ship) }
    end

    def commit(coor)
      response = board.get_position(coor)
      ship = get_ship(response)
      if ship.nil?
        :miss
      else
        update_ship(ship, coor)
      end
    end

    def get_ship(ship)
      @ship_log[ship]
    end

    def update_ship(ship, coor)
      ship.status(coor)
    end

    def add_ship(ship)
      id = ship[:type][0]
      @ship_log[id] = @ship.new(config: ship, coordinates: board.coordinates(ship))
    end
  end
end
