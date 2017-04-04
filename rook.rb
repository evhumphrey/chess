require_relative 'piece'
require_relative 'sliding_piece'


class Rook < Piece
  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2656" : "\u265C"
  end
end
