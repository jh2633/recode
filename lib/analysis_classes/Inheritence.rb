class Inheritence
  def run(string, classes)
    match_data = string.match(/class (.+?) < (.+?)\n/)
    return {parent: match_data[2], child: match_data[1]}
  end
end
