require_relative 'piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(position, board)
    super(position, board)
    @symbol = "p"
  end
end
