module HTTP
  class Base < Sinatra::Base
    register Sinatra::Async

    configure :development do
      register Sinatra::Reloader
      also_reload SINATRA_ROOT + "/app/models"
      #dont_reload 
    end

    configure do
      set :public_folder, SINATRA_ROOT + '/public'
      set :views, SINATRA_ROOT + '/views'
    end

    get '/css/main.css' do
      sass :"css/main"
    end

    not_found do
      'This is nowhere to be found.'
    end

    error do
      'Sorry there was a nasty error - ' + env['sinatra.error'].name
    end
  end
end
