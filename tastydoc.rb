require 'sinatra'
require_relative 'app/text_view'
require_relative 'app/html_view'
require_relative 'app/css_view'
require_relative 'app/index_view'
require_relative 'data/documents'
require_relative 'app/user_documents'


get "/" do
  IndexView.new({}).render(USER_DOCUMENTS)
end

get %r{/(\w+)(\.html)?$} do
  name = params[:captures].first.to_sym
  HtmlView.new({}).render(USER_DOCUMENTS[name])
end


get %r{/(\w+)(\.txt)?$} do
  content_type 'text/plain'
  name = params[:captures].first.to_sym

  resume, style_sheet = UserDocuments.new(name).pull_documents
  TextView.new(style_sheet).render(resume )
end

get %r{/(\w+)(\.css)$} do
  content_type 'text/css'
  CssView.new({}).render({})
end


