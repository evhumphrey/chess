require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  attr_reader :symbol

  def initialize(position, board)
    super(position, board)
    @symbol = "B"
  end
  
end
