require './player'
require './die'
require './game_turn'

class Game

  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    puts "\n#{@title} Statistics:"

    strong_players, weak_players = @players.partition { |player| player.strong? }
    puts "#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end

    puts "#{weak_players.size} weak players:"
    weak_players.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{strong_players.size} Winners\n---------------------------"
    strong_players.each do |player|
      puts "#{player.name} with a score of #{player.health}"
    end

    puts "\n#{weak_players.size} Losers\n---------------------------"
    weak_players.each do |player|
      puts "#{player.name} with a score of #{player.health}"
    end
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

  def play(rounds)
    heading
    intro
    1.upto(rounds) do |round|
      puts "\nRound #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
end