Dir["./lib/analysis_classes/*.rb"].each {|file| require file }
ANALYSIS_CLASSES = [PublicPrivateInterface, MethodsLessThanFive, ClassesLessThanHundred, LazyPoltergeist, Inheritence, GlobalVariable, ExcessiveMethodParams, ObjectOrgy]

class Code_analyzer
  def initialize(string)
    @string = string
    save_code_to_file
    @classes = get_classes
  end

  def analyse
    results = {}
    ANALYSIS_CLASSES.each{|analysis| results[analysis.name.to_sym]=analysis.new.run(@string, @classes)}
    return results
  end

private

  def save_code_to_file
    File.open("./tmp/temp.rb", 'w') { |file| file.write(@string) }
    require './tmp/temp.rb'
  end

  def get_classes
    classnames = @string.scan(/class (\w+)/).flatten
    classnames.map{|className| Object.const_get("#{className}")}
  end
end
