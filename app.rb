require 'sinatra/base'
require './lib/code_analyzer.rb'
require './lib/repo_manager'
require './lib/response_parser'

class Recode < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, "public") }
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/' do
    session[:username] = params[:username]
    redirect to('/repos')
  end

  get '/repos' do
    response = RepoManager.make_API_call(session[:username])
    @repo = ResponseParser.parse(response)
    erb(:repos)
  end

  get '/repos/:id' do
    session[:repo_name] = params[:id]
    response = RepoManager.make_API_call(session[:username], session[:repo_name])
    @file_list = ResponseParser.parse(response)
    erb(:file)
  end

  post '/analysis' do
    @analysis = Code_analyzer.new(params[:code]).analyse
    @code = params[:code]
    erb(:analysis)
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



    content = RepoManager.make_API_call(session[:username], session[:repo_name], params[:file])
    decoded_content = ResponseParser.extract(content)
    @analysis = Code_analyzer.new(decoded_content).analyse
    erb(:analysis)
  end
end
