
require 'sinatra/base'
require 'pg'
require './lib/posts'
class ClassName < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/posts' do
    @posts = Posts.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    message = params['message']
    connection = PG.connect(dbname: 'posts')
    connection.exec ("INSERT INTO messages (message) VALUES('#{message}')")
  end
  run! if app_file == $0
end
