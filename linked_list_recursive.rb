
class LinkedList
	attr_reader :head 

	def count(node = head)  #termination case and the other case.
		if node.nil? 
			0 
		else
			1 + count(node.next_node)
		end
	end

	def push(data, node = head)   #list doesn't interact with data
		if node.nil?   # if the head was nil to begin with.
			@head = Node.new(data)  #@head needs to stick around
		else
			#new data can go in 2 places:
			if node.next_node.nil?
			# next_node of node...(assign it here then)
				node.next_node = Node.new(data)
			else 
			# or somewhere down the list. (it has a node)
			push(data, node.next_node)
			end
		end
	end

	def position(index, node = head)
		return nil unless node
		if index == 0 #time to exit. 
			node.data
		else
			position(index - 1, node.next_node)  #if we start at say 3 for the index, just keep counting back to hit 0.
		end
	end

	def pop(node = head)
		if node.nil? 
			@head = nil
		elsif node.next_node && node.next_node.next_node.nil? 
			node.next_node = nil
			#node is tail  
		else 
			pop(node.next_node)
		end

	end
end

class Node
	attr_accessor :data, :next_node
	def initialize(data)
		@data = data
	end
end


list = LinkedList.new
list.push("pizza")
list.push("pizza")
list.push("pizza")
list.push("man")
list.push("pizza")
puts list.position(3) 

##########################################
# For counting how many deep in the list. 
# pizza -> sromboli -> lasagna
# pizza -> stormboli -> lasagna
# 1 + count(stromboli)
# 1 + 1 + count(lasagna)
# 1 + 1 + 1 + count(nil)   <- termination case
# 1 + 1 + 1 + 0 -> 3 
##########################################

##### ITERATIVELY ###########
# if current.next_node
# 	current = current.next_node			
# else 
# 	current.next_node = node
# end

# if current.next_node
# 	current = current.next_node
# else
# 	current.next_node = node
# end

# start iterating through nodes
# find the last one. 
# end  
###############################
