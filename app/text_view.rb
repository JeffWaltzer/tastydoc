require_relative 'renderer'
require_relative 'text_builder'

class TextView
  def initialize(style)
  end
  
  def render(document)
    builder= TextBuilder.new
    builder.render(Renderer.new(builder, document))
  end
end
