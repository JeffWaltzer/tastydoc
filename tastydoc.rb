require 'sinatra'
require_relative 'app/text_view'
require_relative 'app/new_html_view'
require_relative 'app/css_view'
require_relative 'app/index_view'
require_relative 'data/documents'

get "/" do
  IndexView.new(RESUMES).render
end

get %r{/(\w+)(\.html)?$} do
  name = params[:captures].first.to_sym
  NewHtmlView.new.render(RESUMES[name], {})
end

get %r{/(\w+)(\.txt)?$} do
  name = params[:captures].first.to_sym
  content_type 'text/plain'
  TextView.new(RESUMES[name]).render
end

get %r{/(\w+)(\.css)$} do
  name = params[:captures].first.to_sym
  content_type 'text/css'
  CssView.new(RESUMES[name]).render
end


