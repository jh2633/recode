require 'curb'
require 'json'
class Repos


attr_reader :repo_names, :user_name

  def initialize(user_name)
    @user_name = user_name
  end

  def self.instance
    @repos
  end

  def self.create(user_name)
    @repos = Repos.new(user_name)
  end

  def repo_list
    c = get_API
    c.perform
    json_hash = JSON.parse(c.body_str)
    @repo_names = json_hash.map do |n|
      n["name"]
    end

  end

private

  def get_API
    Curl::Easy.new("https://api.github.com/users/"+ @user_name +"/repos") do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
  end
end

end
