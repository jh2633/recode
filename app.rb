require 'sinatra/base'
# require 'analysis.rb'

class Recode < Sinatra::Base

  enable :sessions

  get '/index' do
    erb(:index)
    # redirect to('/repos')
  end

end
