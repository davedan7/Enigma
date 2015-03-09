require_relative 'shifter'
require_relative 'rotation_generator'
require_relative 'offset_generator'
require_relative 'splitter'

class Decrypt

  # attr_accessor :key

  def initialize(string, key, date)
    @string = string
    @key = key
    @date = date
  end

  def split
    split = Splitter.new(@string)
    split.split
    split
  end

  def decrypt_rotation
    RotationGenerator.new(@key)
  end

  def decrypt_offset
    OffsetGenerator.new(@date)
  end

  def shift_new
    shift_total = decrypt_rotation.splits.zip(decrypt_offset.splits)
    shift_new = shift_total.map { |arr| arr.reduce{ |sum, n| sum + n}}
    shift_new
  end


  def decrypt
    a_Shifter = Shifter.new(decrypt_offset.splits[0] + decrypt_rotation.splits[0])
    a_new = a_Shifter.decrypt(split.arr[0])

    b_Shifter = Shifter.new(decrypt_offset.splits[1] + decrypt_rotation.splits[1])
    b_new = b_Shifter.decrypt(split.arr[1])

    c_Shifter = Shifter.new(decrypt_offset.splits[2] + decrypt_rotation.splits[2])
    c_new = c_Shifter.decrypt(split.arr[2])

    d_Shifter = Shifter.new(decrypt_offset.splits[3] + decrypt_rotation.splits[3])
    d_new = d_Shifter.decrypt(split.arr[3])

    encrypted_arr = [a_new, b_new, c_new, d_new]

    new_str = []

    i = 0
    until a_new[i] == nil
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    new_str.join

  end


  # def decrypted_arr
  #   decrypted_arr = []
  #   index = 0
  #   shift_new.map do |shift|
  #     i = Shifter.new(shift)
  #     decrypted_arr << i.decrypt(split.arr[index])
  #     index += 1
  #   end
  #   decrypted_arr
  # end
  #
  # def decrypt
  #   puts "Your key is: #{decrypt_rotation.key}, and the date is #{@date}"
  #   new_str = []
  #
  #   index = 0
  #   # until decrypted_arr[i-4] == nil
  #   until decrypted_array[1].length times do
  #     decrypted_arr.each { |block| new_str << block[index]}
  #     index += 1
  #   end
  #   new_str.join
  # end

end

# print fuck.split.arr # => nil

fml = Decrypt.new("b6f3s7pivwqpaf7jt3kotx", "12345", "080315")
print fml.decrypt #==>

# fml = Decrypt.new("4qesb7hv77z49pos9bek9aeldq0oacss0p", "13444", "020315")
# fml = Decrypt.new("hd,0yejf16kmgp2f1o7n07", "57281", "080315")
# # test.decrypt("bzb s0lpvpmwa.4pv 9xuq", "51691", "080315")
# # test.decrypt("hd,0yejf16kmgp2f1o7n07", "57281", "080315")

# >> this is a test ..end..
