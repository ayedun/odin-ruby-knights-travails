#frozen_string_literal: true

class Knight
    attr_accessor :position, :parent, :children, :used_positions
    @@used_positions = []
    @@used_positions_max = (8 * 8) * 4
    @@POSSIBLE_MOVES = [[1,2], [2,1], [-1,2], [-2,1], [1,-2], [2,-1], [-1,-2], [-2,-1]].freeze
    def initialize(position, parent=nil)
        @position = position
        @parent= parent
        @children = []
        #possible_moves
    end

    def possible_moves(current_node = self, queue = Queue.new())
        # p "possible_moves current: #{current_node.position}"
        @@POSSIBLE_MOVES.each do |move|
    
            x = current_node.position[0] + move[0]
            y = current_node.position[1] + move[1]
        

            
            if (x.between?(-7,7)) && (y.between?(-7,7)) && !@@used_positions.include?([x,y]) #shorten map for testing
                @@used_positions << [x,y]
                #@children << Knight.new([x,y], self)
                current_node.children << Knight.new([x,y])

                
            end
        end
        current_node.children.each do |child|
            queue.enq(child)
        end
        possible_moves(queue.deq, queue) unless (queue.empty?)
        #foreach
    end

    def return_used_positions        
        @@used_positions
    end


  
   








end