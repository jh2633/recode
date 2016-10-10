require 'json'
require 'base64'

class Json_parser

  def self.parse(string)
    JSON.parse(string)
  end

  def  self.decode(string)
    Base64.decode64(string)
  end


end
