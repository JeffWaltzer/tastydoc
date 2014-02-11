require 'sinatra'
require_relative 'app/text_view'
require_relative 'app/html_view'
require_relative 'app/css_view'
require_relative 'app/index_view'
require_relative 'data/documents'

get "/" do
  IndexView.new({}).render(RESUMES)
end

get %r{/(\w+)(\.html)?$} do
  name = params[:captures].first.to_sym
  HtmlView.new({}).render(RESUMES[name])
end

get %r{/(\w+)(\.txt)?$} do
  name = params[:captures].first.to_sym
  style_sheet= {indented_sections:
                    [:contact, :text,
                     :projects, :jobs, :responsibilities,
                     :clients],
                bulleted_sections:
                    [:projects, :jobs, :responsibilities,
                     :clients],
                seperated_sections:
                    [:additional_info, :jobs, :experience,
                     :development, :education, :skills,
                     :summary, :contact]}
  content_type 'text/plain'
  TextView.new(style_sheet).render(RESUMES[name])
end

get %r{/(\w+)(\.css)$} do
  content_type 'text/css'
  CssView.new({}).render({})
end


