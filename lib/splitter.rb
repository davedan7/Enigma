class Splitter

  attr_reader :input_split

  def initialize(input)
    @input = input
    @input_split = []
  end

  def split
    @input.chars.each_slice(4) {|block| @input_split << block} #takes a string, and splits into subarrays of 4 characters
    @input_split
  end

  def arr
    i = 0
    arr_total = []

    4.times do # Takes the subarrays created by split and sorts them based on index ( [a,b,c], [a,b,c], [a,b,c] => [[a,a,a], [b,b,b,], [c,c,c]])
      arr = @input_split.map { |n| n[i] }
      arr_total << arr.join
      i += 1
    end

    arr_total
  end

end
#
