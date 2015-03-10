class Splitter  # Individual methods return as a string, input_split returns an array
  attr_reader :input_split

  def initialize(input)
    @input = input
    @input_split = []
  end

  def split
    @input.chars.each_slice(4) {|block| @input_split << block}
    @input_split
  end

  def arr
    i = 0
    arr_total = []

    4.times do
      arr = @input_split.map { |n| n[i] }
      arr_total << arr.join
      i += 1
    end
    
    arr_total
  end

end
#
