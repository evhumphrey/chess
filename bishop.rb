require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2657" : "\u265D"
  end

  protected

  def move_dirs
    DIAGONAL_DIRS
  end

end
