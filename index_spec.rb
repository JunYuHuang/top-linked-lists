require_relative 'spec_helper'
require_relative 'index'

RSpec.describe 'Node class' do
  describe "initialize" do
    it "works if called" do
      node = Node.new
      expect(node.value).to eq(nil)
      expect(node.next_node).to eq(nil)
    end
  end

  describe "value" do
    it "works if called" do
      node = Node.new(0)
      expect(node.value).to eq(0)
    end
  end

  describe "next_node" do
    it "works if called" do
      tail_node = Node.new(1)
      head_node = Node.new(0, tail_node)
      expect(head_node.value).to eq(0)
      expect(head_node.next_node.value).to eq(1)
    end
  end
end

RSpec.describe 'LinkedList class' do
  describe "initialize" do
    it "creates an empty list if called with no arguments" do
      list = LinkedList.new
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
      expect(list.size).to eq(0)
    end

    it "creates a filled list if called with an array of values" do
      list = LinkedList.new([1, 2, 3])
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(3)
      expect(list.size).to eq(3)
    end
  end

  describe "append" do
    it "adds a node with value 1 to the list's end if called with 1 on an empty list" do
      list = LinkedList.new
      list.append(1)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(1)
      expect(list.size).to eq(1)
    end

    it "adds a node with value 3 to the list's end if called with 3 on a 2-sized list" do
      list = LinkedList.new([1, 2])
      list.append(3)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(3)
      expect(list.size).to eq(3)
    end
  end

  describe "prepend" do
    it "inserts a node with value 1 to the list's start if called with 1 on an empty list" do
      list = LinkedList.new
      list.prepend(1)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(1)
      expect(list.size).to eq(1)
    end

    it "inserts a node with value 0 to the list's start if called with 0 on a 2-sized list" do
      list = LinkedList.new([1, 2])
      list.prepend(0)
      expect(list.head.value).to eq(0)
      expect(list.tail.value).to eq(2)
      expect(list.size).to eq(3)
    end
  end

  describe "at" do
    it "returns nil if called with a negative index" do
      list = LinkedList.new
      expect(list.at(-1)).to eq(nil)
    end

    it "returns nil if called with an out-of-bounds index" do
      list = LinkedList.new
      expect(list.at(1)).to eq(nil)
    end

    it "returns nil if called on an empty list" do
      list = LinkedList.new
      expect(list.at(0)).to eq(nil)
    end

    it "returns the middle node if called with 1 on a 3-sized list" do
      list = LinkedList.new([1,2,3])
      expect(list.at(1).value).to eq(2)
    end
  end

  describe "pop" do
    it "returns nil if called on an empty list" do
      list = LinkedList.new
      res = list.pop
      expect(res).to eq(nil)
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
      expect(list.size).to eq(0)
    end

    it "removes and returns the last node if called on a 2-sized list" do
      list = LinkedList.new([1, 2])
      res = list.pop
      expect(res.value).to eq(2)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(1)
      expect(list.size).to eq(1)
    end

    it "removes and returns the last node if called on a 1-sized list" do
      list = LinkedList.new([1])
      res = list.pop
      expect(res.value).to eq(1)
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
      expect(list.size).to eq(0)
    end
  end

  describe "contains?" do
    it "returns false if called with any value on an empty list" do
      list = LinkedList.new
      expect(list.contains?(0)).to eq(false)
    end

    it "returns false if called with a value that is not in the non-empty list" do
      list = LinkedList.new([1,2,3])
      expect(list.contains?(0)).to eq(false)
    end

    it "returns true if called with a value that is in the non-empty list" do
      list = LinkedList.new([1,2,3])
      expect(list.contains?(2)).to eq(true)
    end
  end

  describe "find" do
    it "returns nil if called with any value on an empty list" do
      list = LinkedList.new
      expect(list.find(0)).to eq(nil)
    end

    it "returns nil if called with a value that is not in the non-empty list" do
      list = LinkedList.new([1,2,3])
      expect(list.find(0)).to eq(nil)
    end

    it "returns the correct index if called with a value that is in the non-empty list" do
      list = LinkedList.new([1,2,3])
      expect(list.find(2)).to eq(1)
    end
  end

  describe "to_s" do
    it "returns 'nil' if called on an empty list" do
      list = LinkedList.new
      expect(list.to_s).to eq("nil")
    end

    it "returns the correct string if called on a list of size 1" do
      list = LinkedList.new([1])
      res = "( 1 ) -> nil"
      expect(list.to_s).to eq(res)
    end

    it "returns the correct string if called on a list of size 3" do
      list = LinkedList.new([1,2,3])
      res = "( 1 ) -> ( 2 ) -> ( 3 ) -> nil"
      expect(list.to_s).to eq(res)
    end
  end

  describe "insert_at" do
    it "does nothing if called with (-1, -1) on any list" do
      list = LinkedList.new
      list.insert_at(-1, -1)
      expect(list.size).to eq(0)
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
    end

    it "does nothing if called with (-1, 3) on a 3-sized list" do
      list = LinkedList.new([1,2,3])
      list.insert_at(-1, 3)
      expect(list.size).to eq(3)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(3)
    end

    it "does nothing if called with (-1, 1) on an empty list" do
      list = LinkedList.new
      list.insert_at(-1, 1)
      expect(list.size).to eq(0)
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
    end

    it "inserts a new node at the correct position if called on an empty list" do
      list = LinkedList.new
      list.insert_at(0, 0)
      expect(list.size).to eq(1)
      expect(list.head.value).to eq(0)
      expect(list.tail.value).to eq(0)
    end

    it "inserts a new node at the list's start if called with (6, 0) on a non-empty list" do
      list = LinkedList.new([1,2,3])
      list.insert_at(6, 0)
      expect(list.size).to eq(4)
      expect(list.head.value).to eq(6)
      expect(list.tail.value).to eq(3)
      expect(list.at(0).value).to eq(6)
      expect(list.at(1).value).to eq(1)
    end

    it "inserts a new node at the list's end if called with (6, 2) on a non-empty list" do
      list = LinkedList.new([1,2,3])
      list.insert_at(6, 2)
      expect(list.size).to eq(4)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(6)
      expect(list.at(2).value).to eq(3)
      expect(list.at(3).value).to eq(6)
    end

    it "inserts a new node at the correct position if called with (6, 1) on a non-empty list" do
      list = LinkedList.new([1,2,3])
      list.insert_at(6, 1)
      expect(list.size).to eq(4)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(3)
      expect(list.at(0).value).to eq(1)
      expect(list.at(1).value).to eq(6)
      expect(list.at(2).value).to eq(2)
      expect(list.at(3).value).to eq(3)
    end

    it "inserts a new node at the correct position if called with (6, 2) on a non-empty list" do
      list = LinkedList.new([1,2,3,4])
      list.insert_at(6, 2)
      expect(list.size).to eq(5)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(4)
      expect(list.at(0).value).to eq(1)
      expect(list.at(1).value).to eq(2)
      expect(list.at(2).value).to eq(6)
      expect(list.at(3).value).to eq(3)
      expect(list.at(4).value).to eq(4)
    end
  end

  describe "remove_at" do
    it "does nothing if called with any integer on an empty list" do
      list = LinkedList.new
      list.remove_at(-1)
      expect(list.size).to eq(0)
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
    end

    it "does nothing if called with a negative index on a non-empty list" do
      list = LinkedList.new([1])
      list.remove_at(-1)
      expect(list.size).to eq(1)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(1)
      expect(list.at(0).value).to eq(1)
    end

    it "does nothing if called with an out-of-bounds positive index on a non-empty list" do
      list = LinkedList.new([1])
      list.remove_at(1)
      expect(list.size).to eq(1)
      expect(list.head.value).to eq(1)
      expect(list.tail.value).to eq(1)
      expect(list.at(0).value).to eq(1)
    end

    it "remove the only node if called with 0 on an 1-node sized list" do
      list = LinkedList.new([1])
      list.remove_at(0)
      expect(list.size).to eq(0)
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
    end

    # it "inserts a new node at the list's start if called with (6, 0) on a non-empty list" do
    #   list = LinkedList.new([1,2,3])
    #   list.insert_at(6, 0)
    #   expect(list.size).to eq(4)
    #   expect(list.head.value).to eq(6)
    #   expect(list.tail.value).to eq(3)
    #   expect(list.at(0).value).to eq(6)
    #   expect(list.at(1).value).to eq(1)
    # end
  end
end
