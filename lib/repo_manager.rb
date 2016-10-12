require 'curb'
require 'json'
class RepoManager

  def self.make_API_call(user_name, repo_name = nil, file_name = nil)
    path = getPath(user_name, repo_name, file_name)
    c = get_API(path)
    c.perform
    return c.body_str
  end

private

  def self.getPath(user_name, repo_name, file_name)
    if file_name && repo_name
      "https://api.github.com/repos/#{user_name}/#{repo_name}/contents/#{file_name}"
    elsif repo_name
      "https://api.github.com/repos/#{user_name}/#{repo_name}/contents"
    else
        "https://api.github.com/repos/#{user_name}/repos"
    end
  end

  def self.get_API(path)
    Curl::Easy.new(path) do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
    end
  end
end
