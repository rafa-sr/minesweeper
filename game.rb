require_relative 'board'

def start_game
  board = Board.new()
  puts board.print
end

def run
  start_game
end

run
