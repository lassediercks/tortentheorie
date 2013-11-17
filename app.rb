require 'sinatra'  
require 'haml'  
require 'compass'  
require 'coffee-script'
# require 'csspool'


configure do
  set :haml, {:format => :html5, :escape_html => false}
  set :scss, {:style => :compact, :debug_info => false}
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
end



get '/' do 
  haml :index
end


not_found do  
  status 404  
  'not found'  
end  


get '/js/:script.js' do
  content_type 'text/javascript', :charset => 'utf-8'
  coffee "js/#{params[:script]}".to_sym
end
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass "stylesheets/#{params[:name]}".to_sym, Compass.sass_engine_options
end

