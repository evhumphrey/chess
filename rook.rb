require_relative 'piece'
require_relative 'sliding_piece'


class Rook < Piece
  attr_reader :symbol

  def initialize(position, board)
    super(position, board)
    @symbol = "R"
  end
end
