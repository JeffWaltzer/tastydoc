require 'sinatra'
require_relative 'app/html_view'
require_relative 'app/css_view'
require_relative 'data/documents'

get "/" do
end

get %r{/(\w+)(\.html)?$} do
  name = params[:captures].first.to_sym
  HtmlView.new(RESUMES[name]).render
end

get "/resume.css" do
  content_type 'text/css'
  CssView.new.render
end


