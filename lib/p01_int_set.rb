class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num-1] = true
  end

  def remove(num)
    validate!(num)
    @store[num-1] = false
  end

  def include?(num)
    validate!(num)
    @store[num-1]
  end

  private

  def is_valid?(num)
    return false if num > @store.length
    return false if num < 0
    true
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num)
      mod_num = num % @store.length
      @store[mod_num] << num
    end
  end

  def remove(num)
    mod_num = num % @store.length
    @store[mod_num].delete(num) if include?(num)
  end

  def include?(num)
    mod_num = num % @store.length
    @store[mod_num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      @count += 1
      if @count > num_buckets
        @count = 1
        resize!
      end
      mod_num = num % @store.length
      @store[mod_num] << num
    end
  end

  def remove(num)
    mod_num = num % @store.length
    if include?(num)
      @store[mod_num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    mod_num = num % @store.length
    @store[mod_num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.flatten
    @store = Array.new(num_buckets * 2){Array.new}
    temp_store.each do |el|
      insert(el)
    end
  end

end
