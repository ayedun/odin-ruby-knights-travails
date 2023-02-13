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
        if current_node.position == end_position
            path = print_path(current_node)
            # p "found end position"
            p "The shortest path, made up of #{(path.length-1)} steps to follow is: #{path}"
            return
        end
        if !(current_node.children.empty?)
            current_node.children.each do |child|
                # p "adding child to queue"
                queue.enq(child)
                # p queue.size

            end
        end
        
        knight_moves(queue.deq, end_position, queue) unless ((queue.empty?) || current_node.position == end_position)
        
        if queue.empty?
            
            return
        end
    end

    def print_path(current_node, path = [])
        # p current_node.position
        # p current_node.parent.position
        # p current_node.parent.parent.position
        # p current_node.parent.parent.parent.position
        # p current_node.parent.parent.parent.parent

        path.unshift(current_node.position)
        print_path(current_node.parent, path) unless current_node.parent == nil
        path
    end

    def print_knight(current_node, queue = Queue.new())
        
        # p "Parent position: #{current_node.position}"
        current_node.children.each do |child|
            # puts " \tChild position: #{child.position}"
            queue.enq(child)
        end
        # p"moving on to next parent"
        print_knight(queue.deq, queue) unless (queue.empty?)
    
    end

    


        
end