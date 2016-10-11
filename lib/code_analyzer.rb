class Code_analyzer

  def initialize(string)
    @string = string
  end

  def meth_less_than_five
    array = @string.scan(/def.+?end/m).map{|x| (x.scan(/\n+/).length-1)}
    average = array.inject(:+) / array.length
    percentage = ((array.select{|x| x > 5} || []).length.to_f / array.length) * 100
    absolute = array.select{|x| x > 5}.length
    return {average: average.round(2), percentage: percentage.round(2), absolute: absolute}
  end

end
