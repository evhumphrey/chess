require_relative 'board'
require 'colorize'
require_relative 'cursor'

class Display

  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render_board
    system("clear")
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if @cursor.cursor_pos == [i, j]
          if el.is_a?(NullPiece)
            print "[_]".colorize(:background => :cyan) + " "
          else
            print "[X]".colorize(:background => :cyan) + " "
          end
        else
          if el.is_a?(NullPiece)
            print "[_] "
          else
            print "[X] "
          end
        end
      end
      puts
    end
    # p "cursor pos: #{@cursor.cursor_pos}"
  end


  def play
    while true
      self.render_board
      @cursor.get_input
    end
  end

end

display = Display.new(Board.new)
display.board._make_starting_grid
# b.move_piece([1, 0], [2, 0])

display.play
