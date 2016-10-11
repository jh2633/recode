require 'sinatra/base'
require './lib/code_analyzer.rb'
require './lib/repos_manager'
class Recode < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/' do
    Repos.create(params[:username])
    redirect to('/repos')
  end

before do
  @repo_list = Repos.instance
end

  get '/repos' do
    erb(:repos)
  end

  post 'repos' do
    # API request to get repo content
  end

  get '/analysis' do
    file = File.open('./spec/fixtures/testfile.rb')
    file = file.read
    @analysis = Code_analyzer.new(file).analyse
    erb(:analysis)
  end


end
