#frozen_string_literal: true

class Knight
    attr_accessor :position, :parent, :children, :used_positions
    @@used_positions = []
    @@POSSIBLE_MOVES = [[1,2], [2,1], [-1,2], [-2,1], [1,-2], [2,-1], [-1,-2], [-2,-1]].freeze
    def initialize(position, parent=nil)
       @position = position
       @parent= parent
       @children = []
       possible_moves
    end

    def possible_moves
        @@POSSIBLE_MOVES.each do |move|
    
            x = @position[0] + move[0]
            y = @position[1] + move[1]
        

            
            if (x.between?(-7,7)) && (y.between?(-7,7)) && !@@used_positions.include?([x,y])

                @@used_positions << [x,y]
                @children << Knight.new([x,y], self)
            end
        end
    end

    def print_used_positions        
        @@used_positions.each do |position|
            p position
        end
    end

    def knight_moves(current_node = self, end_position = nil, queue = Queue.new())
        p current_node.position
        @children.each do |child|
            queue.enq(child)
        end
        knight_moves(queue.deq, end_position, queue) unless (queue.empty? || current_position == end_position)
        p current_node.position


        return if queue.empty?

    end
        
   








end