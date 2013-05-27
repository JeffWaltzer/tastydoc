require_relative 'renderer'
require_relative 'haml_builder'

class HtmlView
  def initialize(document, name)
    @builder = HamlBuilder.new(name)
    @renderer= Renderer.new(@builder, document)
  end

  def render
    @builder.render(@renderer)
  end
end
