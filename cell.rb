# frozen_string_literal: true

class Cell
  attr_reader :x, :y, :opened, :number_of_bombs
  attr_accessor :bomb

  def initialize(x, y)
    @x = x
    @y = y
    @opened = false
    @bomb = false
  end

  def open
    @opened = true unless @opened
  end
end
