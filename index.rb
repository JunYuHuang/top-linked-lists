class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  attr_accessor(:value)
  attr_accessor(:next_node)

  def value
    @value
  end

  def next_node
    @next_node
  end
end

class LinkedList
  def initialize(head = nil)
    @head = head
    @tail = nil
    @size = 0

    # TODO - loop to last node and point @tail to it
  end

  attr_accessor(:head)
  attr_accessor(:tail)
  attr_accessor(:size)

  def append(value)
    # TODO
  end

  def prepend(value)
    # TODO
  end

  def size
    # TODO
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    # TODO
  end

  def pop
    # TODO
  end

  def contains?(value)
    # TODO
  end

  def find(value)
    # TODO
  end

  def to_s
    # TODO
  end

  # extra credit (optional)
  def insert_at(value, index)
    # TODO
  end

  def remove_at(index)
    # TODO
  end
end
