require 'sinatra/base'
require 'sinatra/flash'
require './lib/code_analyzer.rb'
require './lib/repo_manager'
require './lib/response_parser'
require './lib/helpers/helpers.rb'


class Recode < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, "public") }
  enable :sessions
  register Sinatra::Flash
  helpers Sinatra::ViewHelper

  get '/' do
    erb(:index)
  end

  post '/' do
    session[:username] = params[:username]
    redirect to('/repos')
  end

  get '/repos' do
    response = RepoManager.make_API_call(session[:username])
    if response[:errors]
      flash[:alert] = "Sorry, we can't find that account. Please try again."
      redirect to('/')
    else
      @repo = ResponseParser.parse(response[:body])
      erb(:repos)
    end
  end

  get '/repos/:id' do
    session[:repo_name] = params[:id]
    response = RepoManager.make_API_call(session[:username], session[:repo_name])
    if response[:errors]
      flash[:alert] = "Sorry something went wrong. Please try again."
      redirect to("/")
    else
      @file_list = ResponseParser.parse(response[:body])
      erb(:file)
    end
  end

  get '/analysis/:file' do
    response = RepoManager.make_API_call(session[:username], session[:repo_name], params[:file])
    if response[:errors]
      flash[:alert] = "Sorry something went wrong. Please try again."
      redirect to("/")
    else
      decoded_content = ResponseParser.extract(response[:body])
      @analysis = Code_analyzer.new(decoded_content).analyse
      @code = decoded_content
      erb(:analysis)
    end
  end

  post '/analysis' do
    @analysis = Code_analyzer.new(params[:code]).analyse
    @code = params[:code]
    erb(:analysis)
  end


end
