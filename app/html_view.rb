require_relative 'renderer'
require_relative 'haml_builder'

class HtmlView
  def initialize(document)
    @builder = HamlBuilder.new
    @renderer= Renderer.new(@builder, document)
  end

  def render
    @builder.render( @renderer)
  end

end
