require_relative 'lib/board'
require_relative 'lib/player'

class Game
  def initialize
    @board = Board.new
  end
  def start_game
    player1 = Player.new('Player1', 'X', @board)
    player2 = Player.new('Player2', 'O', @board)
    current_player = player1

    while true
      puts "#{current_player.name} turn"
      @board.display_board
      puts "select a position 1-9"
      position = gets.chomp.to_i + 1
      current_player.select_position(position)
      winner = check_winner(@board)
      current_player = current_player == player1 ? player2 : player1
      if winner 
        puts "#{winner} wins"
        break
      end
      if check_draw(@board)
        puts "Its a draw"
        break
      end
    end
  end
  def check_draw(board)
    !board.include?(" ")
  end
  def check_winner(board)
    win_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Linhas
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Colunas
      [0, 4, 8], [2, 4, 6]              # Diagonais
    ]
  
    win_combinations.each do |combination|
      if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && board[combination[0]] != " "
        return board[combination[0]]  # Retorna o vencedor (X ou O)
      end
    end
  
    nil  # Nenhum vencedor
  end
end

game = Game.new

game.start_game