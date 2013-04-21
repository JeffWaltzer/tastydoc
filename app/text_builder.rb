class TextBuilder
  def initialize
    @results= []
    @indent= 0
  end

  def render(renderer)
    renderer.render
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
    @results << "#{contents[:text]} (#{contents[:link]})"
  end
end
