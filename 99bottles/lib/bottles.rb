class Bottles

  def verse(number)
  bottle = Bottle.new(number)
  case bottle.number
  when 0 then ending
  else normal(bottle)
  end
  end

  def verses(first,second)
    verse_count = first - second
    verse_string = ""
    verse_count.times do |v|
      verse_string << verse(v)
      verse_string << "\n"
    end
    verse_string
  end

  def normal(bottle)
<<-VERSE
#{bottle.number} #{bottle.phrase} of beer on the wall, #{bottle.number} #{bottle.phrase} of beer.
#{final_verse(bottle)}
VERSE
  end

  def ending
<<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
VERSE
  end


  def final_verse(bottle)
    if bottle.number > 1
     "Take one down and pass it around, #{bottle.number - 1} #{bottle_ending((bottle.number - 1))}."
    else
     "Take it down and pass it around, no more bottles of beer on the wall."
    end
  end

  def bottle_ending(number)
    if number > 1
     "bottles of beer on the wall"
    else
      "bottle of beer on the wall"
    end
  end
end

class Bottle
  attr_reader :number
  def initialize(number=nil)
    @number = number
  end

  def phrase
    case number
    when 1 then 'bottle'
    else 'bottles'
    end
  end
end

class Ending
end