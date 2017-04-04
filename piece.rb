# require_relative "null_piece" TODO comment back ing

class Piece
  attr_reader :color
  
  def initialize(position, board, color)
    @color = color
    @position = position
    @board = board
  end

  def to_s
  end

  def empty?

  end

  def move_into_check

  end


end
