require_relative 'piece'
require_relative 'sliding_piece'


class Queen < Piece
  attr_reader :symbol

  def initialize(position, board)
    super(position, board)
    @symbol = "Q"
  end
end
