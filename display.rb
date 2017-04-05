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
    #TODO: render each piece by their symbol, try using
    system("clear")
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if @cursor.cursor_pos == [i, j]
          if el.is_a?(NullPiece)
            print "[_]".colorize(:background => :cyan) + " "
          else
            print "[#{@board[[i,j]].symbol}]".colorize(:background => :cyan) + " "
          end
        else
          if el.is_a?(NullPiece)
            print "[_] "
          else
            print "[#{@board[[i,j]].symbol}] "
          end
        end
      end
      puts
    end
  end


  def play
    while true
      self.render_board
      @cursor.get_input
    end
  end

end

display = Display.new(Board.new)
p display.play
# b.move_piece([1, 0], [2, 0])

# display.play
