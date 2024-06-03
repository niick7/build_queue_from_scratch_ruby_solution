class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class Queue
  attr_accessor :first, :last, :size

  def initialize
    @first = nil
    @last = nil
    @size = 0
  end

  # Add to the end
  # [1]
  # [1, 2]
  # [1, 2, 3]
  def enqueue(val)
    new_node = Node.new(val)
    if @size == 0
      @first = new_node
      @last = new_node
    else
      old_last = @last
      old_last.next = new_node
      @last = new_node
    end
    @size += 1

    @size
  end

  # Remove from the beginning
  # [1, 2, 3]
  # [2, 3]
  # [3]
  def dequeue
    return nil if @size == 0

    old_first = @first
    if @size == 1
      @first = nil
      @last = nil
    else
      new_first = old_first.next
      @first = new_first
      old_first.next = nil
    end
    @size -= 1

    old_first.value
  end
end

queue = Queue.new
queue.enqueue('a')
queue.enqueue('b')
queue.enqueue('c')
puts queue
puts queue.dequeue