require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  attr_reader :symbol

  def initialize(position, board)
    super(position, board)
    @symbol = "K"
  end
end
