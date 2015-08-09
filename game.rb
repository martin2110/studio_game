class Game
  require_relative 'player'
  require_relative 'die'
  require_relative 'game_turn'
  require_relative 'treasure_trove'

  attr_reader :title

  def initialize(title)
    @title   = title
    @players = Array.new
  end

  def add_player(player)
    @players << player
  end
  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end
  def print_stats
    strong_players, wimpy_players   =  @players.partition  {|p1| p1.strong? }
    puts "\n#{@title} Statistics:"

    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end

  end
  def total_points
    @players.map { |p| p.points }.reduce(0, :+)
    @players.reduce(0) { |sum, player| sum + player.points }
  end
  def play(round)
    1.upto(round) do
      puts "\nRound #{round}:"
      puts "There are #{@players.size} players in : "
      @players.each do |player|
        puts player
      end

      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.length} treasures to be found:"
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
  end
end