require 'sinatra/base'
require './lib/analysis.rb'

class Recode < Sinatra::Base

  enable :sessions

  get '/index' do
    erb(:index)
  end

  post '/index' do
    redirect to('/repos')
  end

  get '/repos' do
    erb(:repos)
  end
end
