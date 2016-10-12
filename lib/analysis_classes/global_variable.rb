class GlobalVariable
  def run(string, classes)
    match_data = string.match(/(\$\w+)/).to_a.uniq
    return nil if match_data.empty?
    return {number: match_data.length, name: match_data }
  end
end
