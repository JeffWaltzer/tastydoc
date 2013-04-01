class HamlBuilder
  def section(div_class, div_content)
    haml_tag(".#{div_class}") do
      yield(div_content, div_class) if block_given?
    end
  end

  def text(contents)
    haml_concat contents
  end

  def link(contents)
    haml_tag("a", href: contents[:link]) do
      yield contents[:text]
    end
  end
end
