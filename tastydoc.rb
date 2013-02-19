require 'sinatra'
require_relative 'app/haml_view'
require_relative 'data/jeffs_resume'

get "/" do
  HamlView.new(JEFFS_RESUME).render
end
