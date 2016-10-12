require 'sinatra/base'
require './lib/code_analyzer.rb'
require './lib/repo_manager'
class Recode < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/' do
    session[:username] = params[:username]
    redirect to('/repos')
  end

  get '/repos' do
    @repo_list = RepoManager.new(session[:username])
    @repo = @repo_list.repo_list
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

  get '/repos/:id' do
    @file_list = RepoManager.new(session[:username])
    @file_list.repo_name = params[:id]
    @file_list = @file_list.file_list
    erb(:file)
  end



end
