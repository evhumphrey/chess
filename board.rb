require_relative 'null_piece'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  # protected

  def _make_starting_grid
    valid_rows = [0, 1, 7, 8]

    @grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if valid_rows.include?(i)
          @grid[i][j] = Piece.new
        else
          @grid[i][j] = NullPiece.new
        end
      end
    end
  end

end

b = Board.new

b._make_starting_grid
p b.grid
