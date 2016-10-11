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
