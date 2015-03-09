require_relative 'shifter'
require_relative 'rotation_generator'
require_relative 'offset_generator'
require_relative 'splitter'
require_relative 'encryption_key'

class Crack

  def initialize(string, date)
    @string = string
    @new_str
    @key = 0
    @date = date
  end

  def split
    split = Splitter.new(@string)
    split.split
    split
  end

  def crack_rotation
    @key.to_s.rjust(5, "0")
  end

  def splits(input)
    [input[0..1].to_i, input[0..1].to_i, input[0..1].to_i, input[0..1].to_i,]
  end

  def crack_offset
    OffsetGenerator.new(@date)
  end

  def shift_new
    shift_total = splits(crack_rotation).zip(crack_offset.splits)
    shift_new = shift_total.map { |arr| arr.reduce{ |sum, n| sum + n}}
    shift_new
  end

  def cracked_arr
    cracked_arr = []
    index = 0
    shift_new.map do |shift|
      i = Shifter.new(shift)
      cracked_arr << i.decrypt(split.arr[index])
      index += 1
    end
    cracked_arr
  end

  def crack
    # puts "Your key is: #{crack_rotation.key}, and the date is #{@date}"
    new_str = []

    index = 0
    @string.length.times do
      cracked_arr.each { |block| new_str << block[index]}
      index += 1
    end
    @new_str = new_str.join
  end

  def cracker
    until @new_str[-7..-1] == "..end.."
      @Key += 1
      crack
    end
    puts "Cracked key is: #{@key.to_s.rjust(5, "0")}"
  end

end


fuck = Crack.new("test", "080315")
# print fuck.crack_rotation
print fuck.shift_new
