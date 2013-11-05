class RenderingContext < Struct.new(:view, :content_name, :document, :indent)
  def render_text
    view.paragraph(content_name, indent) do
      "#{view.indent_string(indent+1)}#{document}\n"
    end
    #  "#{view.begin_paragraph(content_name, indent)}#{view.indent_string(indent+1)}#{document}\n#{view.end_paragraph(indent)}"
  end

  def render_link
    view.paragraph(content_name, indent) do
      document_text = document[:text] || document[:link]
      "#{view.indent_string(indent+1)}<a href='#{document[:link]}'>#{document_text}</a>\n"
    end
  end

  def render_array
    document.map do |element|
      sub_context= RenderingContext.new(view, content_name, element, indent)
      sub_context.render_document
    end.join('')
  end

  def render_hash
    view.paragraph(content_name, indent) do |indent|
      document.map do |key, value|
        sub_context= RenderingContext.new(view, key, value, indent)
        sub_context.render_document
      end.join('')
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