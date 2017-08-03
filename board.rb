require_relative 'tile.rb'
require 'byebug'

class Board

  def self.new_grid(size = 9)
    grid = Array.new(size) { Array.new(size) }
    board = Board.new(grid)
    board.populate_grid
    board
  end

  def initialize(grid)
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def populate_grid(num_bombs = @grid.length)
    num_tiles = @grid.length * @grid[0].length
    tiles = Tile.generate_tiles(num_tiles, num_bombs).shuffle
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        self[[row, col]] = tiles.pop
      end
    end
  end

  def render
    @grid.each do |row|
      temp_row = ""
      row.each do |col|
        temp_row += col.to_s
      end
      puts temp_row
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new_grid
  p b
  b.render
end
