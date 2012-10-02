require './player'
require './die'
require './game_turn'

class Game

  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(name)
    @players << name
  end

  def heading
    puts "".center(50,"-")
    puts "There are #{@players.size} in #{@title}."
    puts "".center(50,"-")
  end

  def intro
    @players.each do |player|
       puts player
    end
  end

  def play
    heading
    intro
    @players.each do |player|
      GameTurn.take_turn(player)
      puts player
    end
  end
end