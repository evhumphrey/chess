require_relative 'null_piece'
require 'byebug'
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

  def move_piece(start_pos, end_pos)
    # byebug
    if self[start_pos].is_a?(NullPiece)
      raise "No piece here"
    elsif self[end_pos].is_a?(Piece) && !self[end_pos].is_a?(NullPiece)
      raise "Cannot move, piece already here"
      #TODO: check for player
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
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
b.move_piece([1, 0], [2, 0])
p b
