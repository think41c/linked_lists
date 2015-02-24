require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './linked_list.rb'

class LinkTest < Minitest::Test 

	def test_it_works

		assert true
	end

	def test_it_creates_nodes
		node = Node.new("Eric")
		assert_equal "Eric",node.node_name
	end

	def test_a_new_node_has_no_pointer
		node = Node.new("Eric")
		assert_equal nil,node.next_node
	end

	def test_a_pointer_can_be_added_to_a_node
		node = Node.new("Eric")
		node.next_node = "Pizza Dude"
		assert_equal "Pizza Dude",node.next_node
	end

	def test_the_pointer_can_be_changed
		node = Node.new("Eric")
		node.next_node = "Pizza Dude"
		node.next_node = "Other Guy"
		assert_equal "Other Guy",node.next_node
	end

	def test_it_can_build_a_single_node
		link = List.new
		link.add_node("Eric")
		assert_equal "Eric",link.node.node_name
	end

	def test_it_can_assign_a_head
		link = List.new
		link.add_node("Andrew")
		assert_equal "Andrew",link.head.node_name
	end

	def test_it_can_create_multiple_nodes
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Eric")
		assert_equal "Andrew",link.head.node_name
		assert_equal "Tony",link.node.node_name
	end

	def test_it_can_count
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Eric")
		assert_equal 3,link.count_nodes
	end

	def test_it_counts_with_no_nodes
		link = List.new
		assert_equal 0,link.count_nodes
	end

	def test_it_outputs_out_the_node_list
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Eric")		
		assert_equal ["Andrew","Tony","Eric"],link.print_nodes
	end

	def test_it_outputs_nil_with_zero_nodes
		link = List.new
		assert_equal nil,link.print_nodes
	end

	def test_it_can_access_the_last_element_of_the_list
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Eric")
		assert_equal "Eric",link.access_node.node_name
	end

	def test_it_returns_nil_when_accessing_list_with_zero_nodes
		link = List.new
		assert_equal nil,link.access_node
	end
	
	def test_it_pops_end_element
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Eric")
		link.pop_node
		assert_equal "Tony",link.access_node.node_name
	end

		# access an element by numeric position (as with an array index)
		# Pop the "first" element (head gets removed, second element becomes head)
		# Push an element onto the beginning of the list (first element becomes second element)
		# Remove the (first occurance | all occurances) of an element by data content
		# Remove an element by position
		# Insert an element at an arbitrary position
		# Add an element after a known node
		# Find whether a data element is or is not in the list
		# Find the distance between two nodes

	def test_it_returns_nil_if_pop_with_zero_nodes
		link = List.new
		assert_equal nil,link.pop_node
	end

	def test_it_can_push_element_to_front_of_list
		link = List.new
		link.add_node("Andrew")
		link.push_front("Tony")
		assert_equal "Tony",link.head.node_name
	end

	def test_it_removes_first_occurence_of_data
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Andrew")
		link.delete_first("Andrew")
		assert_equal ["Tony","Andrew"],link.print_nodes
	end

	def test_it_can_delete_first_occurence_of_data_if_it_is_the_head
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Andrew")
		link.delete_all("Andrew")
		assert_equal ["Tony"],link.print_nodes
	end

	def test_it_can_delete_node_at_specific_place
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Andrew")
		link.delete_at(1)
		assert_equal ["Tony","Andrew"],link.print_nodes
	end

	def test_it_can_add_node_at_specific_place
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Andrew")
		link.add_at(3,"Eric")
		assert_equal ["Andrew","Tony","Eric","Andrew"],link.print_nodes
	end
end


	