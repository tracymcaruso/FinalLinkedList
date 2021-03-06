class IterativeLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def count
    if @head.nil?
      0
    else
      count = 1
      current = @head
      while current.link?
        count += 1
        current = current.link
      end
      count
    end
  end

  def push(data)
    if !@head
      @head = Node.new(data)
    else
      current = head
      while current.link?
        current = current.link
      end
      current.link = Node.new(data)
    end
  end

  def last_node
    current = head
    while current.link?
      current = current.link
    end
    current
  end

  def pop
    current = head
    previous = nil
    while current.link?
      previous = current
      current = current.link
    end

    if previous.nil?
      @head = nil
    else
      previous.link = nil
    end
    current.data
  end


  def delete(target)
    if head.data == target
      @head = head.link
    else
      current = head
      last = nil
      while current.link?
        last = current
        current = current.link

        if current.data == target
          last.link = current.link
        end
      end
    end
  end




end




class Node
  attr_accessor :link
  attr_reader :data

  def initialize(input_data)
    @data = input_data
  end

  def link?
    link
  end
end



list = IterativeLinkedList.new

list.push("Cat")
list.push("Dog")
list.push("Pizza")
list.push("Cat")
list.push("Dog")
list.pop



puts list.inspect.split
