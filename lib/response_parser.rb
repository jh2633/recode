require 'json'
require 'base64'

class ResponseParser

  def self.extract(string)
    json = self.convert(string)
    json['content'] = self.decode(json['content'])
    return json['content']
  end

  def self.parse(string)
    self.convert(string).map{|n| n["name"]}
  end

private

  def self.convert(string)
    JSON.parse(string)
  end

  def  self.decode(string)
    Base64.decode64(string)
  end


end
