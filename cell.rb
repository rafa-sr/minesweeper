class Cell
  attr_reader :x, :y, :open, :number_of_bombs
  attr_accessor :bomb

 def initialize(x, y)
    x=x
    y=y
    @open = false
    @bomb = false
  end

  def is_open?
    return @open
  end

  def is_a_bomb?
    return @bomb
  end

end
