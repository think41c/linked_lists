# Thoughts on Linked List: 
# Access an element by numeric position (as with an array index)
# Pop the "first" element (head gets removed, second element becomes head)
# Push an element onto the beginning of the list (first element becomes second element)
# Remove the (first occurance | all occurances) of an element by data content
# Remove an element by position
# Insert an element at an arbitrary position
# Add an element after a known node
# Find whether a data element is or is not in the list
# Find the distance between two nodes

class Node

	attr_reader :node_name
	attr_accessor :next_node

	def initialize(node)
		@node_name = node
		@next_node = nil
	end
end

class List

	attr_accessor :head, :node

	def initialize
	end

	def add_node(node)
	 	if head == nil
			@node = Node.new(node)
			@head = @node
		else 
			while @node.next_node != nil
				@node = @node.next_node
			end
			@node.next_node = Node.new(node)
		end
	end

	def count_nodes
		if head == nil
			count = 0
		else
			count = 1
			@node = @head
			while @node.next_node != nil
				count += 1
				@node = @node.next_node
			end
			count 
		end
	end

	def print_nodes
		output = []
		if head == nil
			output = nil
		else
			@node = @head
			while @node.next_node != nil 
				output << @node.node_name
				@node = @node.next_node
			end
			output << @node.node_name
		end
	end

	def access_node
		if head == nil
			@node = nil
		else
			@node = @head
			while @node.next_node != nil
				@node = @node.next_node
			end
			@node
		end
	end

	def pop_node
		previous = nil
		if head == nil
			puts "no nodes"
		elsif head.next_node == nil
			@head = nil
		else
			while @node.next_node != nil
				previous = @node
				@node = @node.next_node
			end
			previous.next_node = nil
		end
	end

	def push_front(node)
		@node = Node.new(node)
		if head == nil
			@head = @node
		else
			previous_head = @head
			@head = @node
			@head.next_node = previous_head
		end
	end

	def delete_first(node_delete)
		delete_count = 0
		unless head == nil
			@node = @head 
			while @node.next_node != nil && delete_count < 1
				if @head.node_name == node_delete
					@head = @head.next_node
					delete_count += 1
				else
					previous_node = @node
					@node = @node.next_node
					if @node.node_name == node_delete 
						previous_node.next_node = @node.next_node 
						delete_count += 1
					end
				end
			end
		end
	end

	def delete_all(node_delete)
		unless head == nil
			@node = @head 
			while @node.next_node != nil 
				if @head.node_name == node_delete
					@head = @head.next_node
				else
					previous_node = @node
					@node = @node.next_node
					if @node.node_name == node_delete 
						previous_node.next_node = @node.next_node 
					end
				end
			end
		end
	end

	def delete_at(number)
		previous_node = nil
		node_number = 1
		unless head == nil || number > count_nodes
			@node = @head
			if @head.next_node == nil 
				@head = nil
			elsif number == 1
				@head = @head.next_node
			else
				while node_number < number
					node_number += 1
					previous_node = @node
					@node = @node.next_node
				end
				previous_node.next_node = @node.next_node
			end
		end
	end

	def add_at(number,node_name)
		unless head == nil || number > count_nodes + 1
			count = 1
			if head == nil
				@node = Node.new(node)
				@head = @node
			elsif number == count_nodes + 1
				add_node(node_name)
			else 
				@node = @head 
				until count == number-1
					count += 1
					@node = @node.next_node	
				end
			pointer = @node.next_node
			@node.next_node = Node.new(node_name)
			@node.next_node.next_node = pointer
			end
		end
	end 
end

link = List.new
link.add_node("Andrew")
link.add_node("Tony")
link.add_node("Andrew")
link.add_at(3,"eric")
puts link.print_nodes

