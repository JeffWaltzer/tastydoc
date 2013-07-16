require_relative 'renderer'
require_relative 'text_builder'

class TextView
  def initialize(style)
  end
  
  def render_document(document)
    builder= TextBuilder.new
    builder.render(Renderer.new(builder, document))
  end
end
