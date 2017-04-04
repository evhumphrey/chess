require_relative 'null_piece'
require 'byebug'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self._make_starting_grid
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

  protected

  def _make_starting_grid
    valid_rows = [0, 1, 7, 8]

    @grid.each_with_index do |row, i|

      row.each_with_index do |el, j|
        pos = [i, j]
        case i
        when 7
          case j
          when 0, 7
            self[pos] = Rook.new(pos, self, :white)
          when 1, 6
            self[pos] = Knight.new(pos, self, :white)
          when 2, 5
            self[pos] = Bishop.new(pos, self, :white)
          when 3
            self[pos] = Queen.new(pos, self, :white)
          when 4
            self[pos] = King.new(pos, self, :white)
          end
        when 0
          case j
          when 0, 7
            self[pos] = Rook.new(pos, self, :black)
          when 1, 6
            self[pos] = Knight.new(pos, self, :black)
          when 2, 5
            self[pos] = Bishop.new(pos, self, :black)
          when 3
            self[pos] = Queen.new(pos, self, :black)
          when 4
            self[pos] = King.new(pos, self, :black)
          end
        when 6
          self[pos] = Pawn.new(pos, self, :white)
        when 1
          self[pos] = Pawn.new(pos, self, :black)
        else
          self[pos] = NullPiece.new(nil, nil, nil)
        end
      end
    end
  end


end

b = Board.new

p b
