require_relative "null_piece"

class Piece

  def initialize(position, board, color)
    @color = color
    @position = position
    @board = board
  end

  def moves
  end

end
