require 'curb'
require 'json'
class RepoManager

attr_reader :repo_names, :user_name

  def initialize(user_name)
    @user_name = user_name
  end

  def repo_list
    c = get_API
    c.perform
    json_hash = JSON.parse(c.body_str)
    return json_hash.map{|n| n["name"]}
  end

private

  def get_API
    Curl::Easy.new("https://api.github.com/users/"+ @user_name +"/repos") do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
  end
end

end
