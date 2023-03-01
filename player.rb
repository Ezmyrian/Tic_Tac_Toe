class Player
  attr_reader :name
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def player_1_mark(player)
    until player.mark == 'X' || player.mark == 'O'
      puts "Will #{player.name} be X or O?"
      player_mark = gets.chomp.upcase
      unless player_mark == 'X' || player_mark == 'O'
        puts "Mark must be X or O"
      end
      player.mark = player_mark 
    end
  end
  
  def player_2_mark(player_1, player_2)
    if player_1.mark == 'X'
      player_2.mark = 'O'
    else
      player_2.mark = 'X'
    end
  end
end
