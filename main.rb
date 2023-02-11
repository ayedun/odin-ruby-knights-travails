require_relative "./knights.rb"
require_relative "./game_board.rb"
require "pry-byebug"

game = Board.new()
knight = Knight.new([0,0])
# game.print_used_positions(knight.return_used_positions) #knight's all used positions
p ""
p knight.children.length
# knight.children.each do |child|
#     p child.position
# end

knight.possible_moves
#for each children, do possible moves
#continue until @@used_positions = @@used_positions_max
game.print_knight(knight)
p knight.return_used_positions.length
#game.knight_moves(knight, [3, 0]) #knight's moves from start to end position
#left on creating knight_moves