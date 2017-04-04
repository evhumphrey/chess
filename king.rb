require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2654" : "\u265A"
  end
end
