require_relative 'shifter'
require_relative 'rotation_generator'
require_relative 'offset_generator'
require_relative 'splitter'
require_relative 'encryption_key'

class Encrypt
  attr_accessor :key

  def initialize(string)
    @key    = EncryptionKey.new
    @string = string
  end

  def split
    split = Splitter.new(@string)
    split.split
    split.arr
  end

  def rotation
    RotationGenerator.new(@key.key)
  end

  def offset
    OffsetGenerator.new
  end

  def shift_new   # 4 item array of the total shifts to pass to encrypt
    shift_total = rotation.splits.zip(offset.splits)
    shift_new   = shift_total.map { |arr| arr.reduce{ |sum, n| sum + n}  }
    shift_new
  end

  def encrypted_arr
    a_Shifter     = Shifter.new(shift_new[0])
    a_new         = a_Shifter.encrypt(split[0])

    b_Shifter     = Shifter.new(shift_new[1])
    b_new         = b_Shifter.encrypt(split[1])

    c_Shifter     = Shifter.new(shift_new[2])
    c_new         = c_Shifter.encrypt(split[2])

    d_Shifter     = Shifter.new(shift_new[3])
    d_new         = d_Shifter.encrypt(split[3])

    [a_new, b_new, c_new, d_new]
  end

  def encrypt
    new_str = []

    i = 0
    encrypted_arr[0].length.times do
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    new_str.join
  end

end

if __FILE__ == $0

  fileread    = ARGV[0]
  filecreate  = ARGV[1]

  txt         = File.open(fileread, 'r')
  line        = txt.readline

  fnew        = Encrypt.new(line)
  encrypted   = fnew.encrypt

  if File.exists?(filecreate)
    puts "The file already exists. Overwrite? y or n"
    input = STDIN.gets.strip

    if input.downcase == "y"
      new_file = File.open(filecreate, 'w')
      new_file.write("#{encrypted}")
      puts "Created file '#{filecreate}' with the key #{fnew.key.key} and date #{fnew.offset.date}"
    elsif input.downcase == "n"
      puts "Aborted"
    end

  else
    new_file = File.open(filecreate, 'w')
    new_file.write("#{encrypted}")
    puts "Created file '#{filecreate}' with the key #{fnew.key.key} and date #{fnew.offset.date}"
  end

end

# new_file = File.open(filecreate, 'w')
# new_file.write("#{encrypted}")
#
# puts "Created file '#{filecreate}' with the key #{fnew.key.key} and date #{fnew.offset.date}"
#
# end


# if File.exists?(filecreate)
#   puts "The file already exists. Overwrite? y or n"
#   input = gets
#   if input.downcase == "y"
#     new_file = File.open(filecreate, 'w')
#     new_file.write("#{encrypted}")
#     puts "Created file '#{filecreate}' with the key #{fnew.key.key} and date #{fnew.offset.date}"
#   elsif input.downcase == "n"
#     puts "Aborted"
#     return
#   end
# end

# def encrypted_arr
#   encrypted_arr = []
#   index = 0
#   arr = shift_new.map do |shift|    # shift_new is array of shift values. Use the shift values to create a shfiter for each value
#     i = Shifter.new(shift)
#     # encrypted_arr << i.encrypt(split[index])  # Into an array, push each item of the split array
#     index += 1
#   end
#   arr.each do |shift|
#     encrypted_arr << shift.encrypt(split[])
#   end
#   encrypted_arr
# end
#
# def encrypt(date = offset.date)
#   # puts "Your key is: #{rotation.key}, and the date is #{date}"
#   new_str = []
#
#   i = 0
#   until encrypted_arr[i] == nil
#     encrypted_arr.each { |block| new_str << block[i]}
#     i += 1
#   end
#   new_str.join
# end
#
# def echo
#   puts "Generated"
# end
