require_relative 'renderer'
require_relative 'text_builder'

class TextView
  def initialize(document)
    @builder= TextBuilder.new
    @renderer= Renderer.new(@builder, document)
  end
  
  def render
    @builder.render(@renderer)
  end
end
