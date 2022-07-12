require 'byebug'
require_relative 'cell'

class Board
  attr_reader :width, :height

# width x height
# row x colum

  def initialize(width: 9, height: 5)
    @width = width
    @heigth = height
    @row = Array.new(width)
    @colum = Array.new(height)
    @board = Array.new(width) { Array.new(height) }
    @mines_count = width*height*0.15
    init_cells
  end

  def init_cells
    @row.each_with_index do |x, row_index|
      @colum.each_with_index do |y, col_index|
        @board[row_index][col_index] = Cell.new(row_index,col_index)
      end
    end
    set_bombs
  end

  def print
    @row.each_with_index do |x, index_row|
      @colum.each_with_index do |y, index_col|
       cell = @board[index_row][index_col]
       puts cell.inspect
      end
    end
  end

  def open_cell(x, y)
   cell = @board[x,y]
  end

private
  def set_bombs
    bombs = 0
    while bombs < @mines_count
      x = rand(0..@width-1)
      y = rand(0..@heigth-1)
      cell= @board[x][y]
      unless cell.is_a_bomb?
        cell.bomb = true
        bombs += 1
      end
    end
  end
end
