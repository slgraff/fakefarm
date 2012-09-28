    class Player

      def initialize(name, health=100)
        @name = name.capitalize
        @health = health
      end

      def to_s
        "I'm #{@name} with a health of #{@health}"
      end

      def blam
        @health -= 10
        "#{@name} got blammed!"
      end

      def w00t
        @health += 150
        puts "#{@name} got w00ted!"
      end
    end

    pl1 = Player.new('moe')
    puts pl1
    puts pl1.blam
    pl1.w00t
    puts pl1