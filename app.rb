
require 'sinatra/base'
require 'pg'
require './lib/posts'
class ClassName < Sinatra::Base
  get '/' do
    erb :'/posts/sign_up'
  end
  
  post '/' do
    username = params['username']
    password = params['password']
    connection = PG.connect(dbname: 'posts')
    connection.exec("INSERT INTO user_details (username, password) VALUES('#{username}', '#{password}')")

    redirect '/home'
  end

  get '/home' do
    erb :'posts/home'
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
    redirect '/posts'


  end
  run! if app_file == $0
end
