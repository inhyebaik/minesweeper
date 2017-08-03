require_relative 'board.rb'

class MineSweeper

  def initialize
    @board = Board.new_grid(9)
  end


end



if __FILE__ == $PROGRAM_NAME
  game = MineSweeper.new
  p game
end
