require_relative 'board'

class Player
  attr_accessor :name, :marker
  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @board = board
  end
  def select_position(position)
    if(0..8).include?(position) && @board[position] == " "
      @board[position] = @marker 
      @board.display_board
    else
      puts 'Invalid Position, select a number between 1 and 9'
    end
  end
end

