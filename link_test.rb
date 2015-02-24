require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './linked_list'

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
		assert_equal 3, link.count_nodes
	end

	def test_it_prints_out_the_node_list
		link = List.new
		link.add_node("Andrew")
		link.add_node("Tony")
		link.add_node("Eric")
	end
end
