require 'curb'
require 'json'
class RepoManager

attr_reader :user_name
attr_accessor :repo_name
attr_accessor :file_name

  def initialize(user_name)
    @user_name = user_name
    @repo_name = nil
    @file_name = nil
  end

  def repo_list
    c = get_API
    c.perform
    json_hash = JSON.parse(c.body_str)
    return json_hash.map{|n| n["name"]}
  end

  def file_list
    c = get_files
    c.perform
    json_hash = JSON.parse(c.body_str)
    return json_hash.map{|n| n["name"]}
  end

  def content
    c = get_content
    c.perform
    return c.body_str
  end

private

  def get_API
    Curl::Easy.new("https://api.github.com/users/"+ @user_name +"/repos") do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
    end
  end

  def get_files
    Curl::Easy.new("https://api.github.com/repos/"+ @user_name +"/"+@repo_name+"/contents/") do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
    end
  end

  def get_content
    Curl::Easy.new("https://api.github.com/repos/"+ @user_name +"/"+@repo_name+"/contents/"+@file_name) do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
    end
  end


end
