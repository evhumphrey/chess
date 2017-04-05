require_relative 'piece'
require_relative 'stepping_piece'


class Knight < Piece
  include SteppingPiece

  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2658" : "\u265E"
  end

  protected

  def move_diffs
    L_MOVES
  end
end
