require_relative 'shifter'
require_relative 'rotation_generator'
require_relative 'offset_generator'
require_relative 'splitter'
require_relative 'encryption_key'

class Crack

  attr_reader :new_str, :key

  def initialize(string, date)
    @string = string
    @key      = 0
    @date     = date
    @new_str  = ""
  end

  def split
    split = Splitter.new(@string)
    split.split
    split
  end

  def offset
    OffsetGenerator.new(@date)
  end

  def encrypted_arr
    rotation = RotationGenerator.new(@key.to_s.rjust(5, "0"))

    a_Shifter = Shifter.new(offset.splits[0] + rotation.splits[0])
    a_new     = a_Shifter.decrypt(split.arr[0])

    b_Shifter = Shifter.new(offset.splits[1] + rotation.splits[1])
    b_new     = b_Shifter.decrypt(split.arr[1])

    c_Shifter = Shifter.new(offset.splits[2] + rotation.splits[2])
    c_new     = c_Shifter.decrypt(split.arr[2])

    d_Shifter = Shifter.new(offset.splits[3] + rotation.splits[3])
    d_new     = d_Shifter.decrypt(split.arr[3])

    encrypted_arr = [a_new, b_new, c_new, d_new]
  end

  def crack
    new_str = []

    i = 0

    encrypted_arr[0].length.times do
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    @new_str = new_str.join.strip
  end

  def cracker
    crack

    until @new_str[-7..-1] == "..end.."
      @key += 1
      crack
    end

    @new_str
    @key.to_s.rjust(5, "0")
  end

end

if __FILE__ == $0

fileread    = ARGV[0]
filecreate  = ARGV[1]
date        = ARGV[2]

text  = File.open(fileread, 'r')
line  = text.readline

dammit         = Crack.new(line, date)
cracked        = dammit.cracker
cracked_string = dammit.new_str

new_file = File.open(filecreate, 'w')
new_file.write("The cracked code is: #{cracked} \n")
new_file.write("The cracked string is: '#{cracked_string}'")

puts "Created file '#{filecreate}' with the key #{cracked} and date #{date}"

end
