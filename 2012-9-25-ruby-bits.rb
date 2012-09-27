# Our each_on_system method is working, but it's not very useful unless the block has access to each game that we find. Modify each_on_system to pass the Game object into the block so we can print its name.


class Library
  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def each_on_system(system)
    games.each do |game|
      yield if game == system
    end
  end
end
