require_relative './rotator'

class Encryptor

  attr_reader :input_split

  def initialize
    @rotator = Rotator.new
    @input_split = []
  end

  def split(input)
    input.chars.each_slice(4) {|block| @input_split << block}
  end

  def encrypt_a
    a_new = @input_split.map do |block|
      block[0 + @rotator.a_shift_total]
    end
  end

end

test = Encryptor.new
a = test.encrypt_a
print a

# arr = [1, 2, 3 ,4]
# (a, b, c, d) = arr
# puts a
# puts b
# puts c
# puts d
#
# test = Encryptor.new
# test.split("This is a test")
# print test.input_split
