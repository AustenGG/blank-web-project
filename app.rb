
require 'sinatra/base'

class ClassName < Sinatra::Base
  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end
