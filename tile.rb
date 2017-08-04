class Tile

  def initialize(bool_bomb)
    @bool_bomb = bool_bomb
    @bool_revealed = false
  end

  def self.generate_tiles(num_tiles, num_bombs)
    tiles = []
    num_bombs.times { tiles << Tile.new(true) }
    (num_tiles - num_bombs).times { tiles << Tile.new(false) }
    tiles
  end

  def revealed?
    @bool_revealed
  end

  def bomb?
    @bool_bomb
  end 

  def reveal
    @bool_revealed = true
  end

  def hide
    @bool_revealed = false
  end

  def to_s
    unless @bool_revealed
      return " * "
    end

    if @bool_bomb
      " X "
    else
      " _ "
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  p Tile.generate_tiles(4, 2)
end
