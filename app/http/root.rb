class HTTP::Root < HTTP::Base

  def self.singletons
    @singletons ||= []
  end

  error 401 do
    '401'
  end

  get '/' do
    haml :index 
  end
end
