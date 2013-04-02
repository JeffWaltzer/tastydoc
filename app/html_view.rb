require 'haml'
require_relative 'renderer'
require_relative 'haml_builder'

class HtmlView
  def initialize(document)
    @builder = HamlBuilder.new
    @renderer= Renderer.new(@builder, document)
  end

  def section(contents)
    @renderer.section(contents)
  end

  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
            %link(rel="stylesheet" type="text/css" href="resume.css")
          %body
            - content.section
    END

    Haml::Engine.new(template).render(@builder, content: @renderer)
  end
end
