class Code_analyzer

  def initialize(string)
    @string = string
  end

  def meth_less_than_five
    @string.scan(/def.+?end/m).map{|x| (x.scan(/\n+/).length-1)}
  end

end
