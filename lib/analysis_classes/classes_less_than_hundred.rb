class ClassesLessThanHundred
  def run(string, classes)
    return nil if string.empty?
    array = string.scan(/class.+$/m).map{|x| (x.scan(/\n+/).length-1)}
    average = array.inject(:+) / array.length
    percentage = ((array.select{|x| x < 100} || []).length.to_f / array.length) * 100
    absolute = array.select{|x| x > 100}.length
    return {average: average.round(2), percentage: percentage.round(2), absolute: absolute}
  end
end
