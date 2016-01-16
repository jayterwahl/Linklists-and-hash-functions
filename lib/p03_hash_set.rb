require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    val = key
    key = hash_it!(key)
    p "Key to insert is: #{key}"
    if !include?(val)
      @count += 1
      if @count > num_buckets
        @count = 1
        resize!
      end
      mod_num = key % @store.length
      puts "insert: #{@store.length}"
      @store[mod_num] << key
    end
    p "Store is: #{@store}"
    @store
  end

  def include?(key)
    key = hash_it!(key)
    mod_num = key % @store.length
    puts "include?: #{@store.length}"
    p "Looking for: #{key}"
    p "Store is #{@store}"
    @store[mod_num].include?(key)
  end

  def remove(key)
    val = key
    key = hash_it!(key)
    mod_num = key % @store.length

    if include?(val)
      @store[mod_num].delete(key)
      @count -= 1
    end
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

  def hash_it!(val)
    val.hash
  end
end
