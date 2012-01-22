require './main'

configure :development do
  p "development"
end

configure :staging do
  p "staging"
end

configure :production do
  p "production"
end

map "/" do
  run HTTP::Root
end
