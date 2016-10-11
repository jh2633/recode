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
    c = Curl::Easy.new("https://api.github.com/users/"+ @user_name +"/repos") do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
    end

    c.perform

    json_hash = JSON.parse(c.body_str)
    json_hash.map! do |n|
      n["name"]
    end
    @repo_names = json_hash.each {|x| x}
  end

end
