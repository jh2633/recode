class Code_analyzer

  def initialize(string)
    @string = string
    save_to_file
    require './tmp/temp.rb'
    get_classes
  end

  def analyse
    return {
      classes: @classes,
      methods_less_than_five: meth_less_than_five,
      class_less_than_hundred: class_less_than_hundred,
      public_vs_private: public_vs_private,
      lazy_poltergeist: lazy_poltergeist
      }
  end

private

  def save_to_file
    File.open("./tmp/temp.rb", 'w') { |file| file.write(@string) }
  end

  def get_classes
    @classes = @string.scan(/class (\w+)/).flatten
    @classes = @classes.map do |className|
      Object.const_get("#{className}")
    end
  end

  def public_vs_private
    @classes.map{|classname|
      number_private = (classname.new.private_methods - Object.new.private_methods).length
      number_public = (classname.new.public_methods - Object.new.public_methods).length
      percentage = (number_public.to_f / number_private)*100
      return {number_public: number_public, number_private:number_private, percentage: percentage.round(2)}
      }
  end

  def meth_less_than_five
    array = @string.scan(/def.+?end/m).map{|x| (x.scan(/\n+/).length-1)}
    average = array.inject(:+) / array.length
    percentage = ((array.select{|x| x < 5} || []).length.to_f / array.length) * 100
    absolute = array.select{|x| x > 5}.length
    return {average: average.round(2), percentage: percentage.round(2), absolute: absolute}
  end

  def class_less_than_hundred
    array = @string.scan(/class.+$/m).map{|x| (x.scan(/\n+/).length-1)}
    average = array.inject(:+) / array.length
    percentage = ((array.select{|x| x < 100} || []).length.to_f / array.length) * 100
    absolute = array.select{|x| x > 100}.length
    return {average: average.round(2), percentage: percentage.round(2), absolute: absolute}
  end

  def lazy_poltergeist
    lazy = @classes.map{|classname|
      number_private = (classname.new.private_methods - Object.new.private_methods).length
      number_public = (classname.new.public_methods - Object.new.public_methods).length
      [classname, number_public + number_private]}.select{|classname, x| x<2}.flatten
      return {:class=>lazy[0], :number_methods=>lazy[1], :number_attributes=>lazy[0].instance_variables.length}
  end

end
