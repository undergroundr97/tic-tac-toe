class Board
  def initialize
    @board = Array.new(9," ")
  end
  def display_board
    puts "#{@board[1]} | #{@board[2]} | #{@board[3]}"
    puts "- + - + -"
    puts "#{@board[4]} | #{@board[5]} | #{@board[6]}"
    puts "- + - + -"
    puts "#{@board[7]} | #{@board[8]} | #{@board[9]}"
  end
end
board = Board.new

board.display_board