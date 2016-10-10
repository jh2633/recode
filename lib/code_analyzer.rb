class Code_analyzer

  def initialize(string)
    @string = string
  end

def meth_less_than_five
  @string.gsub(/\n+/,"*-*").split(/def|end/).map { |x| x.scan(/\*-\*/).count-1}
end



end
