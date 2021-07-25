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

get %r{/(\w+)(\.html)?} do
  name = params[:captures].first.to_sym
  user_documents = UserDocuments.new(name).pull_documents
  resume= user_documents[:resume]
  style_sheet = user_documents[:style_sheet]
  HtmlView.new(style_sheet).render(resume)
end


get %r{/(\w+)(\.txt)?} do
  content_type 'text/plain'
  name = params[:captures].first.to_sym

  user_documents = UserDocuments.new(name).pull_documents
  resume= user_documents[:resume]
   style_sheet = user_documents[:style_sheet]
  TextView.new(style_sheet).render(resume )
end

get %r{/(\w+)(\.css)} do
  content_type 'text/css'
  CssView.new({}).render({})
end


