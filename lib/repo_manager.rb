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
    first = repo_name ? "repos" : "users"
    second = repo_name ? "#{repo_name}/contents/#{file_name}" : "repos"
    return "https://api.github.com/#{first}/#{user_name}/#{second}"
  end

  def self.get_API(path)
    Curl::Easy.new(path) do |curl|
      curl.headers["User-Agent"] = "myapp-0.0"
    end
  end
end
