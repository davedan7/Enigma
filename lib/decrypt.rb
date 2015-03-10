require_relative 'shifter'
require_relative 'rotation_generator'
require_relative 'offset_generator'
require_relative 'splitter'

class Decrypt

  def initialize(string, key, date)
    @string = string
    @key    = key
    @date   = date
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
    shift_new   = shift_total.map { |arr| arr.reduce{ |sum, n| sum + n}}
    shift_new
  end

  def decrypted_arr
    a_Shifter     = Shifter.new(decrypt_rotation.splits[0] + decrypt_offset.splits[0])
    a_new         = a_Shifter.decrypt(split.arr[0])

    b_Shifter     = Shifter.new(decrypt_rotation.splits[1] + decrypt_offset.splits[1])
    b_new         = b_Shifter.decrypt(split.arr[1])

    c_Shifter     = Shifter.new(decrypt_rotation.splits[2] + decrypt_offset.splits[2])
    c_new         = c_Shifter.decrypt(split.arr[2])

    d_Shifter     = Shifter.new(decrypt_rotation.splits[3] + decrypt_offset.splits[3])
    d_new         = d_Shifter.decrypt(split.arr[3])

    [a_new, b_new, c_new, d_new]
  end


  def decrypt
    new_str = []

    i = 0
    decrypted_arr[0].length.times do
      decrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    new_str.join
  end

end

if __FILE__ == $0

  fileread    = ARGV[0]
  filecreate  = ARGV[1]
  key         = ARGV[2]
  date        = ARGV[3]

  txt  = File.open(fileread, 'r')
  line = txt.readline

  shit  = Decrypt.new(line, key, date)
  decrypted = shit.decrypt

  if File.exists?(filecreate)
    puts "The file already exists. Overwrite? y or n"
    input = STDIN.gets.strip

    if input.downcase == "y"
      new_file = File.open(filecreate, 'w')
      new_file.write("#{decrypted}")

      puts "Created file '#{filecreate}' with the key #{key} and date #{date}"
    elsif input.downcase == "n"
      puts "Aborted"
    end

  else
    new_file = File.open(filecreate, 'w')
    new_file.write("#{decrypted}")

    puts "Created file '#{filecreate}' with the key #{key} and date #{date}"
  end

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
