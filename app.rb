require 'sinatra/base'
require './lib/code_analyzer.rb'
require './lib/repo_manager'
require './lib/json_parser'
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

  post '/analysis' do
    @analysis = Code_analyzer.new(params[:code]).analyse
    @code = params[:code]
    erb(:analysis)
  end

  get '/repos/:id' do
    @file_list = RepoManager.new(session[:username])
    @file_list.repo_name = params[:id]
    session[:repo_name] = params[:id]
    @file_list = @file_list.file_list
    erb(:file)
  end

  get '/analysis/:file' do
    @content = RepoManager.new(session[:username])
    @content.repo_name = session[:repo_name]
    @content.file_name = params[:file]
    @decoded_content = Json_parser.extract(@content.content)
    @analysis = Code_analyzer.new(@decoded_content).analyse
    @code = @decoded_content
    erb(:analysis)
  end

  get '/recode_logo.png' do
    :recode_logo
  end



end
