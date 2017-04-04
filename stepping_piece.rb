require 'byebug'

module SteppingPiece

  SPACE_MOVES = [
    [1,0],
    [1,1],
    [1,-1],
    [-1, 0],
    [-1, -1],
    [-1, 1],
    [0, 1],
    [0, -1]
  ]

  L_MOVES = [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1]
  ]

  def moves(start_pos)

    all_moves = move_diffs.map do |el|
      [el[0] + start_pos[0],
      el[1] + start_pos[1]]
    end

    all_moves.reject! do |move|
      @board[move].color == @color
    end

    # remove out of bounds stuff (which shouldn't matter;
    # cursor won't allow user to even go out of bounds
    all_moves.select do |move|
      move.first.between?(0, 7) && move.last.between?(0, 7)
    end
  end

  private

  def move_diffs
  end
end
