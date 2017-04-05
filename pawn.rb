require_relative 'piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(position, board, color)
    super(position, board, color)
    @symbol = @color == :white ? "\u2659" : "\u265F"
  end

  def moves(start_pos)
    all_moves = []
    all_moves = forward_steps(start_pos).map do |diff|
      [start_pos[0] + diff[0], start_pos[1] + diff[1]]
    end

    # remove positions where a piece is (directly infront)
    all_moves.select! { |pos| @board[pos].is_a?(NullPiece) }


    attack_moves = side_attacks.map do |diff|
      [start_pos[0] + diff[0], start_pos[1] + diff[1]]
    end

    attack_moves.reject! { |pos| @board[pos].is_a?(NullPiece) }

    (all_moves + attack_moves).reject { |pos| out_of_bounds?(pos) }
  end

  protected

  def at_start_row?(start_pos)
    if start_pos[0] == 6 && @color == :white
      return true
    end
    if start_pos[0] == 1 && @color == :black
      return true
    end
    false
  end

  def forward_steps(pos)
    case @color
    when :black
      if at_start_row?(pos)
        [[2, 0], [1, 0]]
      else
        [[1, 0]]
      end
    when :white
      if at_start_row?(pos)
        [[-2, 0], [-1, 0]]
      else
        [[-1, 0]]
      end
    end
  end

  def side_attacks
    case @color
    when :black
      [[1, -1], [1, 1]]
    when :white
      [[-1, -1], [-1, 1]]
    end
  end

  private

  def out_of_bounds?(pos)
    unless pos[0].between?(0, 7) && pos[1].between?(0, 7)
      return true
    end
    false
  end
end
