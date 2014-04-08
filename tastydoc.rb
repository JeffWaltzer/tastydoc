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

def render_document(username, view_class)
  user_documents = UserDocuments.new(username).pull_documents
  resume= user_documents[:resume]
  style_sheet = user_documents[:style_sheet]
  view_class.new(style_sheet).render(resume, username)
end

get %r{/(\w+)(\.html)?$} do
  content_type 'text/html'
  render_document(params[:captures].first.to_sym, HtmlView)
end

get %r{/(\w+)(\.txt)?$} do
  content_type 'text/plain'
  render_document(params[:captures].first.to_sym, TextView)
end

get %r{/(\w+)(\.css)$} do
  content_type 'text/css'
  render_document(params[:captures].first.to_sym, CssView)
end
