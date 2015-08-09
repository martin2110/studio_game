class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end
  def <=>(old)
   old.score <=> self.score
  end
  def say_hello
    "I'm #{@name} with a health of #{@health}"
  end
  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end
  def score
    @health + self.points
  end
  def strong?
    @health > 100
  end
  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found  #{treasure.name} worth #{treasure.points} points"
    puts "#{@name}'s treasures: #{@found_treasures}"
  end
  def points
    @found_treasures.values.reduce(0, :+)
  end
end


if __FILE__ == $0
  player = Player.new("moe", 150)
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
  puts player.strong?
  puts player.wimpy?
end