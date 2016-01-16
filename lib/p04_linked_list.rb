class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  attr_reader :first
  def initialize
    @first = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if @first.nil?
    @first
  end

  def last
    current_link = @first
    until current_link.nil?
      return current_link.val if current_link.prev.nil?
      current_link = current_link.prev
    end
  end

  def empty?
    @first.nil?
  end

  def get(key)
    current_link = @first
    until current_link.nil?
      return current_link.val if current_link.key == key
      current_link = current_link.prev
    end
    nil
  end

  def include?(key)
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    @first.next = new_link unless @first.nil?
    new_link.prev = @first
    @first = new_link
  end

  def remove(key)
    current_link = @first
    until current_link.nil?
      if current_link.key == key
        current_link.next.prev = current_link.prev
        current_link.prev.next = current_link.next
      end
      current_link = current_link.prev
    end
    nil
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end


list = LinkedList.new
list.insert(:first, 1)
list.insert(:second, 2)
list.insert(:third, 3)

puts list.first
