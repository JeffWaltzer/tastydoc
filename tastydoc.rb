require 'sinatra'
require_relative 'app/html_view'
require_relative 'app/css_view'
require_relative 'data/jeffs_resume'

get "/:name.html" do
  HtmlView.new(RESUMES[params[:name].to_sym]).render
end

get "/resume.css" do
  content_type 'text/css'
  CssView.new.render
end