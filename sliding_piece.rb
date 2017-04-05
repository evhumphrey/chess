require 'byebug'

module SlidingPiece

  DIAGONAL_DIRS =
  [
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1, -1]
  ]

  STRAIGHT_DIRS =
  [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0]
  ]

  def moves(start_pos)
    all_moves = []
    move_dirs.each do |dir|
      # byebug
      all_moves.concat(grow_unblocked_moves(start_pos, dir))
    end
    all_moves
  end

  private
  def move_dirs
  end

  def grow_unblocked_moves(start_pos, dir)
    dir_moves = []
    current_pos = start_pos.dup
    current_pos[0] += dir.first
    current_pos[1] += dir.last

    until out_of_bounds?(current_pos)
      current_piece = @board[current_pos]
      if !current_piece.is_a?(NullPiece) && current_piece.color == @color
        break
      end

      dir_moves << current_pos.dup

      if !current_piece.is_a?(NullPiece) && current_piece.color != @color
        break
      end

      current_pos[0] += dir.first
      current_pos[1] += dir.last
    end

    dir_moves
  end



  def out_of_bounds?(pos)
    unless pos[0].between?(0, 7) && pos[1].between?(0, 7)
      return true
    end
    false
  end
end
