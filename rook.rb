require_relative 'piece'
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2656" : "\u265C"
  end

  protected

  def move_dirs
    STRAIGHT_DIRS
  end

end
