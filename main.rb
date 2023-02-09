require_relative "./knights.rb"
require_relative "./game_board.rb"
require "pry-byebug"

game = Board.new()
knight = Knight.new([0,0])
knight.possible_moves
knight.print_used_positions
knight.knight_moves([0,0], [1,2])