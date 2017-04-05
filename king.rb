require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  include SteppingPiece

  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2654" : "\u265A"
  end

  protected

  def move_diffs
    SPACE_MOVES
  end

end
