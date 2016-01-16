class Fixnum
  # Fixnum#hash already implemented for you
  #thanks
end

class Array
  def hash
    to_s.hash

    # out = []
    # each_with_index do |el, i|
    #   out << el.hash * (i + 1)
    # end
    # out.reduce(:+).to_s.slice!(0..20).to_i
  end
end

class String
  def hash
    char_arr = split("")
    num_array = []

    char_arr.each_with_index do |char, i|
       num_array << ((char.ord * i+1).to_s )
    end

    hashval = num_array.join("")
    hashval.slice!(0..20).to_i
  end
end

# class Hash
#   def hash
#     flatten.hash
#   end
# end


# arr = []
# alphabet = ("a".."z").to_a
# alphabet.each do |letter|
#   arr << letter.hash
# end
#


# puts [1,2,3].hash
# puts [3, 2, 1].hash
# puts [3, 2,'a','b', 1].hash
# puts :poo.hash
# a = {:a => 3, :b => 2}
# b = {:b => 2, :a => 3}
# p a.hash
# puts b.hash
