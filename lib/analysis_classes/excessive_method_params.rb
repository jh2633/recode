class ExcessiveMethodParams
  def run(string, classes)
    methods =  get_methods(classes).map {|class_name, method_name| {class: class_name, method: method_name, arity: class_name.new.method(method_name).arity}}
    return methods.select{|x| x[:arity] >=4}
  end

  private

  def get_methods(classes)
    classes.map{|class_name| (class_name.new.methods-Object.new.methods).map{|x| [class_name, x]}}.flatten(1)
  end
end
