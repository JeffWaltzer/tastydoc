require 'haml'
require_relative 'html_document'
require_relative 'html_builder'

class HtmlView
  def initialize(document)
    @document= HtmlDocument.new(document)
  end

  def section(contents)
    @document.section(contents)
  end

  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
            %link(rel="stylesheet" type="text/css" href="resume.css")
          %body
            - render content
    END
    builder = HtmlBuilder.new
    Haml::Engine.new(template).render(builder, content: @document)
  end
end
