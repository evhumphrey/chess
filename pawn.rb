require_relative 'piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2659" : "\u265F"
  end
end
