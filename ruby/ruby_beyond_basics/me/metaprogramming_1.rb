require_relative './dinosaurs'

class Tyron
  attr_reader :period, :size, :weight, :hobbies
  def initialize(data)
    @period = data[:period]
    @size = data[:size]
    @weight = data[:weight]
    @hobbies = data[:hobbies]
  end
end

trex = Tyron.new(TREX_DATA)
# puts trex.hobbies


class Dinosaur
  def self.add_attribute(key, val)
    define_method(key) do
      val
    end
  end

  def initialize(data)
    data.each do |key,value|
      self.class.add_attribute(key, value)
    end
  end
end

class Ptry < Dinosaur
  def match_diet(diet)
    self.diet == diet
  end

  def match_suborder(suborder)
    self.suborder == suborder
  end
end

d = Dinosaur.new(TREX_DATA)

pt = Ptry.new(PTERODACTYL_DATA)
puts pt.match_suborder(d.suborder)
puts pt.match_diet(d.diet)

