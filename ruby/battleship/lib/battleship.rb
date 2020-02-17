require "battleship/version"

module Battleship
  class Error < StandardError; end
  require 'battleship/game'
  require 'battleship/ship'
  require 'battleship/board'
  require 'battleship/state'
end

