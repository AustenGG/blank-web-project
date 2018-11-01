
require 'sinatra/base'

class ClassName < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/posts' do
    @posts = Posts.all
    erb :'posts/index'
  end
  run! if app_file == $0
end
