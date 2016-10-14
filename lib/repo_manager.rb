require 'curb'
require 'json'
class RepoManager
API_CLIENT = Curl::Easy
  def self.make_API_call(user_name, repo_name = nil, file_name = nil)
    path = getPath(user_name, repo_name, file_name)
    response = get_API(path)
    response.perform
    return make_response(response)
  end

private

  def self.make_response(response)
    errors = response.status != "200 OK" ? response.status : nil
    return {errors: errors, body: response.body_str}
  end

  def self.getPath(user_name, repo_name, file_name)
    first = repo_name ? "repos" : "users"
    second = repo_name ? "#{repo_name}/contents/#{file_name}" : "repos"
    return "https://api.github.com/#{first}/#{user_name}/#{second}"
  end

  def self.get_API(path)
    client = SPEC_CLIENT || API_CLIENT
    client.new(path){|curl| curl.headers["User-Agent"] = "myapp-0.0" }
  end
end
