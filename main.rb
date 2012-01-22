require 'bundler'
Bundler.require

SINATRA_ROOT = File.expand_path(File.dirname(__FILE__))
SINATRA_ENV = ENV["RACK_ENV"]

# Setup EventMachine
EM.schedule do
  # Timer
   EM.add_periodic_timer(10)       {  }
   EM.add_periodic_timer(60)       { EveryMinute.go }
   EM.add_periodic_timer(60*10)    { EveryTenMinute.go }
  # EM.add_periodic_timer(60*60)    { EveryHour.go }
  # EM.add_periodic_timer(6*60*60)  { EverySixHour.go }
  # EM.add_periodic_timer(24*60*60) { EveryDay.go }
end

# Setup Mongoid
Mongoid.configure do |config|
  host = 'localhost'
  port = 27017
  options = {}
  dbname = "scraper_#{SINATRA_ENV}"
  config.master = Mongo::Connection.new(host, port, options).db(dbname)
end

# Setup Redis
Redis::Classy.db = Redis.new(:host => 'localhost')
Redis::Classy.select(0)

# Setup App and Library
Dir.glob("#{SINATRA_ROOT}/lib/**/*").each {|file| require file if File.file?(file) }
Dir.glob("#{SINATRA_ROOT}/app/**/*").each {|file| require file if File.file?(file) }
