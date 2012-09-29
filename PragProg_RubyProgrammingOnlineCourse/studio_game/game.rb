require './player'

class Game

  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(name)
    @players << name
  end

  def play
    puts "There are #{@players.size} in our game #{@title}."
    @players.each do |player|
       puts player.blam
       puts player.w00t
    end
  end
end