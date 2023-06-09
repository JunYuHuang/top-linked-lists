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
  def initialize(node_values = [])
    @head = nil
    @tail = nil
    @size = 0

    prev = nil
    last_pos = node_values.size - 1

    node_values.each_index do |i|
      curr = Node.new(node_values[i])
      @size += 1
      @head = curr if i == 0
      @tail = curr if i == last_pos
      prev.next_node = curr if prev
      prev = curr
    end
  end

  attr_accessor(:head)
  attr_accessor(:tail)
  attr_accessor(:size)

  def append(value)
    node = Node.new(value)

    if @size == 0
      @head = node
      @tail = node
      @size += 1
      return
    end

    @tail.next_node = node
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)

    if @size == 0
      @head = node
      @tail = node
      @size += 1
      return
    end

    node.next_node = @head
    @head = node
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if (index.class != Integer or index < 0 or
                  index >= @size or @size == 0)

    curr = @head
    i = 0
    while i < @size
      return curr if i == index
      curr = curr.next_node
      i += 1
    end
  end

  def pop
    return nil if @size == 0

    if @size == 1
      popped = @tail
      @head = nil
      @tail = nil
      @size -= 1
      return popped
    end

    old_tail = @tail
    new_tail = nil
    curr = @head
    prev = nil

    while curr != old_tail
      new_tail = curr
      curr = curr.next_node
    end

    new_tail.next_node = nil
    @tail = new_tail
    @size -= 1

    old_tail
  end

  def contains?(value)
    return false if @size == 0

    curr = @head
    while curr
      return true if curr.value == value
      curr = curr.next_node
    end

    false
  end

  def find(value)
    return nil if @size == 0

    index = 0
    curr = @head
    while curr
      return index if curr.value == value
      curr = curr.next_node
      index += 1
    end

    nil
  end

  def to_s
    return "nil" if @size == 0

    res = []
    curr = @head
    while curr
      res.push("( #{curr.value.to_s} ) -> ")
      curr = curr.next_node
    end
    res.push("nil")
    res.join
  end

  # extra credit (optional)

  def insert_at(value, index)
    return if (index.class != Integer or index < 0 or
              (index >= @size && @size >= 1) or
              (index != 0 && size == 0))

    if @size == 0
      curr = Node.new(value)
      @head = curr
      @tail = curr
      @size += 1
      return
    end

    if index == 0
      curr = Node.new(value, @head)
      @head = curr
      @size += 1
      return
    end

    if index == @size - 1
      curr = Node.new(value)
      @tail.next_node = curr
      @tail = curr
      @size += 1
      return
    end

    dummy = Node.new(nil, @head)
    prev = dummy
    curr = dummy.next_node
    i = 0
    while curr
      if i == index
        new_node = Node.new(value, curr)
        prev.next_node = new_node
        @size += 1
        break
      end
      prev = curr
      curr = curr.next_node
      i += 1
    end
  end

  def remove_at(index)
    return if (index.class != Integer or
              index < 0 or index >= @size or @size == 0)

    dummy = Node.new(nil, @head)
    prev = dummy
    curr = dummy.next_node
    i = 0

    while curr
      if i != index
        prev = curr
        curr = curr.next_node
        i += 1
        next
      end

      nxt = curr.next_node

      # handles 1-sized lists
      if curr == @head && curr == @tail
        @head = nil
        @tail = nil
      else
        @head = nxt if curr == @head
        @tail = prev if curr == @tail
      end

      curr.next_node = nil
      prev.next_node = nxt
      @size -= 1
      break
    end
  end
end
