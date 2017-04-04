require_relative 'piece'
require_relative 'sliding_piece'


class Queen < Piece
  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2655" : "\u265B"
  end
end
