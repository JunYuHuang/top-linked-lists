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
    it "TODO" do
      # TODO
      expect(true).to eq(true)
    end
  end
end
