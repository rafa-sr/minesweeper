# frozen_string_literal: true

require_relative 'cell'

class Board
  attr_reader :width, :height, :map, :mines_count

  MINES_PERCENTAGE = 0.15

  def initialize(width: 9, height: 5)
    @width = width
    @height = height
    @map = Array.new(@width) { Array.new(@height) }
    @mines_count = (width * height * MINES_PERCENTAGE).floor.freeze
    init_cells
  end

  def print
    @map.map(&:inspect)
  end

  def open_cell(x, y)
    cell = @map[x][ y]
  end

  private

  def set_bombs
    bombs = 0
    while bombs < @mines_count
      x = rand(0..@width - 1)
      y = rand(0..@height - 1)
      cell = @map[x][y]
      unless cell.is_a_bomb?
        cell.bomb = true
        bombs += 1
      end
    end
  end

  def init_cells
    (0..@width - 1).each do |row_index|
      (0..@height - 1).each do |col_index|
        @map[row_index][col_index] = Cell.new(row_index, col_index)
      end
    end
    set_bombs
  end
end
