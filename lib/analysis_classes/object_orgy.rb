class ObjectOrgy
  def run(string, classes)
    methods = get_methods(classes)
    accessors = methods.select{|c,m| m =~ /\=\Z/}.map{|x| {class: x[0], accessor: x[1]}}
  end

  def get_methods(classes)
    classes.map{|class_name| (class_name.new.methods-Object.new.methods).map{|x| [class_name, x]}}.flatten(1)
  end
end
