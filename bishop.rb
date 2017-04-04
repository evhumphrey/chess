require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2657" : "\u265D"
  end

end
