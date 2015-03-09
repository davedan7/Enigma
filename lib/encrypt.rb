require_relative 'shifter'
require_relative 'rotation_generator'
require_relative 'offset_generator'
require_relative 'splitter'
require_relative 'encryption_key'

class Encrypt
  attr_accessor :key

  def initialize(string, date = nil)
    # @rotation = RotationGenerator.new
    # @offset = OffsetGenerator.new
    @date = date
    @key = EncryptionKey.new
    @string = string
  end

  def split
    split = Splitter.new(@string)
    split.split
    split
  end

  def rotation
    RotationGenerator.new(@key.key)
  end

  def offset
    OffsetGenerator.new(@date)
  end

  def shift_new
    shift_total = rotation.splits.zip(offset.splits)
    shift_new = shift_total.map { |arr| arr.reduce{ |sum, n| sum + n}  }
    shift_new
  end

  # def encrypted_arr
  #   encrypted_arr = []
  #   index = 0
  #   shift_new.map do |shift|
  #     i = Shifter.new(shift)
  #     encrypted_arr << i.encrypt(split.arr[index])
  #     index += 1
  #   end
  #   encrypted_arr
  # end

  # def encrypt(date = offset.date)
  #   puts "Your key is: #{rotation.key}, and the date is #{date}"
  #   new_str = []
  #
  #   i = 0
  #   until encrypted_arr[i] == nil
  #     encrypted_arr.each { |block| new_str << block[i]}
  #     i += 1
  #   end
  #   new_str.join
  # end

  def encrypt
    a_Shifter = Shifter.new(offset.splits[0] + rotation.splits[0])
    a_new = a_Shifter.encrypt(split.arr[0])

    b_Shifter = Shifter.new(offset.splits[1] + rotation.splits[1])
    b_new = b_Shifter.encrypt(split.arr[1])

    c_Shifter = Shifter.new(offset.splits[2] + rotation.splits[2])
    c_new = c_Shifter.encrypt(split.arr[2])

    d_Shifter = Shifter.new(offset.splits[3] + rotation.splits[3])
    d_new = d_Shifter.encrypt(split.arr[3])

    encrypted_arr = [a_new, b_new, c_new, d_new]

    new_str = []

    i = 0
    until a_new[i] == nil
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    new_str.join

  end

end

# filename = ARGV.first
#
# txt = File.open(filename, 'r')
# # line = txt.readline
#
# fuck = Encrypt.new(line)
#
# fuck.key = EncryptionKey.new("12345")
# puts fuck.encrypt



fuck = Encrypt.new("this is a test ..end..", "080315")
fuck.key = EncryptionKey.new("12345")
#
print fuck.encrypt # => nil
# print test.decrypt("4qesb7hv77z49pos9bek9aeldq0oacss0p", "13444", "020315")

# >> .vlhpwvzslw6 7a0qsq5qm
