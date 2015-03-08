class Splitter  # Individual methods return as a string, input_split returns an array

  def initialize(input)
    @input = input
    @input_split = []
  end

  def split
    @input.chars.each_slice(4) {|block| @input_split << block}
    @input_split
  end

  def a
    arr = @input_split.map {|n| n[0]}
    arr.join
  end

  def b
    arr = @input_split.map {|n| n[1]}
    arr.join
  end

  def c
    arr = @input_split.map {|n| n[2]}
    arr.join
  end

  def d
    arr = @input_split.map {|n| n[3]}
    arr.join
  end

  def arr
    [a,b,c,d]
  end

end

test = Splitter.new("abcd")
test.split
print test.arr
