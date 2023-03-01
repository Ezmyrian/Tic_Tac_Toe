require_relative 'player.rb'
require_relative 'board.rb'

class Game
  def initialize()
    @player_1 = nil
    @player_2 = nil
    @game_board = Board.new
    new_players()
  end

  def new_players()
    puts "Who is player 1?"
    player_1 = gets.chomp
    puts "Who is player 2?"
    player_2 = gets.chomp
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
    @player_1.player_1_mark(@player_1)
    @player_2.player_2_mark(@player_1, @player_2)
  end

  def play_game()
    @game_board.print_board()
    is_winner = false
    while is_winner == false
      @game_board.mark_game_board(@player_1, @player_1.mark, @game_board)
      is_winner = @game_board.is_winner?(@player_1, @player_1.mark, @game_board)
      break if is_winner == true
      if @game_board.tie_game?(@game_board) == true
        puts "Tie game"
        break
      end
      @game_board.mark_game_board(@player_2, @player_2.mark, @game_board)
      is_winner = @game_board.is_winner?(@player_2, @player_2.mark, @game_board)
      break if is_winner == true
    end
  end
end

game = Game.new
game.play_game
