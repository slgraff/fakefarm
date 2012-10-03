class Player

  attr_accessor :name, :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} & a score of #{score}"
  end

  def <=>(other)
    other.score <=> score
  end


  def blam
    @health -= 10
    "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health + @name.length
  end

  def strong?
    @health > 100
  end

end

if __FILE__ == $0
  puts "This is File: #{__FILE__}"
  puts "This is $0: #{$0}"
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end