class Player
  attr_reader :name
  attr_accessor :mark

  def initialize(name)
    @name = name
  end
end

def player_1_mark(player)
  until player.mark == 'X' || player.mark == 'O'
    puts "Will #{player.name} be X or O?"
    @player_mark = gets.chomp.upcase
    unless @player_mark == 'X' || @player_mark == 'O'
      puts "Mark must be X or O"
    end
    player.mark = @player_mark 
  end
end

def player_2_mark(player_1, player_2)
  if player_1.mark == 'X'
    player_2.mark = 'O'
  else
    player_2.mark = 'X'
  end
end

def print_board(game_board)
  puts "#{game_board[0]} | #{game_board[1]} | #{game_board[2]}"
  puts '---------'
  puts "#{game_board[3]} | #{game_board[4]} | #{game_board[5]}"
  puts '---------'
  puts "#{game_board[6]} | #{game_board[7]} | #{game_board[8]}"
end

def win_check(mark, game_board)
  case true
  when game_board.values_at(0, 1, 2) == [mark, mark, mark]
    winner = true
  when game_board.values_at(3, 4, 5) == [mark, mark, mark]
    winner = true
  when game_board.values_at(6, 7, 8) == [mark, mark, mark]
    winner = true
  when game_board.values_at(0, 3, 6) == [mark, mark, mark]
    winner = true
  when game_board.values_at(1, 4, 7) == [mark, mark, mark]
    winner = true
  when game_board.values_at(2, 5, 8) == [mark, mark, mark]
    winner = true
  when game_board.values_at(0, 4, 8) == [mark, mark, mark]
    winner = true
  when game_board.values_at(2, 4, 6) == [mark, mark, mark]
    winner = true
  else
    winner = false
  end
end

def assign_marks()
  puts "Who is player 1?"
  player_1 = gets.chomp
  puts "Who is player 2?"
  player_2 = gets.chomp
  player_1 = Player.new(player_1)
  player_2 = Player.new(player_2)
  player_1_mark(player_1)
  player_2_mark(player_1, player_2)
  player_array = [player_1, player_2]
end

def mark_game_board(player, mark, game_board)
  x = false
  until x == true 
    puts "Where will #{player.name} go?"
    location = gets.chomp.to_i
    case location
    when 1..9
      if game_board.include?(location)
        game_board[location - 1] = mark
        print_board(game_board)
        x = true
      else 
        puts "Invalid location number"
      end
    else
      puts "Invalid location"
    end
  end
end

def is_winner?(player, player_mark, game_board)
  is_winner = win_check(player_mark, game_board)
  if is_winner == true
    puts "#{player.name} wins!"
    true
  else
    false
  end
end

def tie_game?(game_board)
  game = game_board.any?(1..9)
  if game == true
    return false
  else
    return true
  end
end

def play_game()
  game_board = Array.new(9)
  game_board = game_board.each_with_index { |value, index| game_board[index] = index + 1 }
  player_array = assign_marks()
  print_board(game_board)
  player_1 = player_array[0]
  player_2 = player_array[1]
  is_winner = false
  while is_winner == false
    mark_game_board(player_1, player_1.mark, game_board)
    is_winner = is_winner?(player_1, player_1.mark, game_board)
    break if is_winner == true
    if tie_game?(game_board) == true
      puts "Tie game"
      break
    end
    mark_game_board(player_2, player_2.mark, game_board)
    is_winner = is_winner?(player_2, player_2.mark, game_board)
    break if is_winner == true
  end
end

play_game()
