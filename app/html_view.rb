require 'haml'
require_relative 'html_document'

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
            - section @document
    END
    Haml::Engine.new(template).render(@document, document: @document)
  end
end
