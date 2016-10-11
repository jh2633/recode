class LazyPoltergeist
  def run(string, classes)
    lazy = classes.map{|classname|
      number_private = (classname.new.private_methods - Object.new.private_methods).length
      number_public = (classname.new.public_methods - Object.new.public_methods).length
      [classname, number_public + number_private]}.select{|classname, x| x<2}.flatten
      return {:class=>lazy[0], :number_methods=>lazy[1], :number_attributes=>lazy[0].instance_variables.length}
  end
end
