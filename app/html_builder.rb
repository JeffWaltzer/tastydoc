class HtmlBuilder
  def concat(string)
    haml_concat(string)
  end

  def tag(name, *rest, &block)
    haml_tag(name, *rest, &block)
  end

  def render(document)
    document.builder = self
    document.section
  end
end
