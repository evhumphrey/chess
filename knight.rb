require_relative 'piece'
require_relative 'stepping_piece'


class Knight < Piece
  attr_reader :symbol

  def initialize(position, board)
    super(position, board)
    @symbol = "k"
  end
end
