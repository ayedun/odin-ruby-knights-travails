require_relative "./knights.rb"
require_relative "./game_board.rb"
require "pry-byebug"

game = Board.new()
knight = Knight.new([3, 3])
knight.possible_moves
game.print_knight(knight)
# p knight.return_used_positions
game.knight_moves(knight, [4, 3]) #knight's moves from start to end position
#left on creating knight_moves