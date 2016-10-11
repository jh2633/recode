require 'sinatra/base'
require './lib/code_analyzer.rb'

class Recode < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/' do
    redirect to('/repos')
  end

  get '/repos' do
    erb(:repos)
  end
end
