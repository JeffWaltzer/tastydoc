require_relative 'renderer'

class TextView
  def initialize(style)
    @results= []
    @indent= 0
  end

  def render_document(document)
    render(Renderer.new(self, document))
  end

  def render(renderer)
    renderer.renderit
    @results.join("\n")
  end

  def nest
    @indent += 1
  end

  def unnest
    @indent -= 1
  end

  def section(section_class, section_content)
    yield(section_content, section_class) if block_given?
  end

  def text(contents)
    @results << ('  ' * @indent + contents)
  end

  def link(contents)
    text("#{contents[:text]} (#{contents[:link]})")
  end
end
