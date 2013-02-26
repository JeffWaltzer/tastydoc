require 'sinatra'
require_relative 'app/html_view'
require_relative 'data/jeffs_resume'

get "/" do
  HtmlView.new(JEFFS_RESUME).render
end

get "/resume.css" do
  content_type 'text/css'
  open("resume.css") {|f| f.read}
end