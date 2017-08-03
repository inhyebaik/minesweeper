class Tile

  def initialize(bool_bomb)
    @bool_bomb = bool_bomb
  end

  def self.generate_tiles(num_tiles, num_bombs)
    tiles = []
    num_bombs.times { tiles << Tile.new(true) }
    (num_tiles - num_bombs).times { tiles << Tile.new(false) }
    tiles
  end

  def to_s
    if @bool_bomb
      " X "
    else
      " * "
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  p Tile.generate_tiles(4, 2)
end
