class Inheritence
  def run(string, classes)
    match_data = string.match(/class (.+?) < (.+?)\n/)
    return nil if match_data.to_a.empty?
    return {parent: match_data[2], child: match_data[1]}
  end
end
