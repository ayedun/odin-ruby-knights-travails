#create a 2d array of 8x8

class Board
    def initialize
        @board = Array.new(8) {Array.new(8)}
    end

    def print_used_positions(knight_used_positions)
        knight_used_positions.each do |position|
            p position
        end
    end

    def knight_moves(current_node, end_position, queue = Queue.new())
        # p current_node
        p current_node.position
        p "current node position #{current_node.position} and end position #{end_position}}"
        if current_node.position == end_position
            p "found end position"
            return
        end
        return if current_node.children.empty?
        current_node.children.each do |child|
            p "adding child to queue"
            queue.enq(child)
            p queue.size

        end
        
        knight_moves(queue.deq, end_position, queue) unless (queue.empty?)
        
        
        if queue.empty?
            
            return
        end
    end

    def print_knight(current_node, queue = Queue.new())
        
        p "Parent position: #{current_node.position}"
        current_node.children.each do |child|
            puts " \tChild position: #{child.position}"
            queue.enq(child)
        end
        p"moving on to next parent"
        print_knight(queue.deq, queue) unless (queue.empty?)
    
    end

    


        
end