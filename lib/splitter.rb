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
# t = Splitter.new("asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf")
# t.split
# print t.arr         # => nil
# print t.input_split  # => nil


  # def a
  #   arr = @input_split.map {|n| n[0]}
  #   arr.join
  # end
  #
  # def b
  #   arr = @input_split.map {|n| n[1]}
  #   arr.join
  # end
  #
  # def c
  #   arr = @input_split.map {|n| n[2]}
  #   arr.join
  # end
  #
  # def d
  #   arr = @input_split.map {|n| n[3]}
  #   arr.join
  # end

# >> ["aaaaaaaaaaaa", "ssssssssssss", "dddddddddddd", "ffffffffffff"][["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"], ["a", "s", "d", "f"]]
