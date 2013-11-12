class RenderingContext < Struct.new(:view, :content_name, :document, :indent)
  def render_text
    view.paragraph(content_name, indent) do
      view.indent(indent+1)
      view.string(document)
    end
  end

  def render_link
    view.paragraph(content_name, indent) do
      url = document[:link]
      text = document[:text] || url
      view.indent(indent+1)
      view.link(text, url)
    end
  end

  def render_array
    document.each do |element|
      sub_context= RenderingContext.new(view, content_name, element, indent)
      sub_context.render_document
    end
  end

  def render_hash
    view.paragraph(content_name, indent) do |indent|
      document.each do |key, value|
        sub_context= RenderingContext.new(view, key, value, indent)
        sub_context.render_document
      end
    end
  end

  def render_document
    if document.is_a?(String)
      render_text
    elsif document.is_a?(Hash)
      if document[:link]
        render_link
      else
        render_hash
      end
    elsif document.is_a?(Array)
      render_array
    end
  end
end