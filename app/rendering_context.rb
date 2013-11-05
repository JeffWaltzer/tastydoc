class RenderingContext < Struct.new(:content_name, :document, :indent)
  def render_text(view)
    view.paragraph(content_name, indent) do
      "#{view.indent_string(indent+1)}#{document}\n"
    end
  #  "#{view.begin_paragraph(content_name, indent)}#{view.indent_string(indent+1)}#{document}\n#{view.end_paragraph(indent)}"
  end

  def render_link(view)
    view.paragraph(content_name,indent) do
      document_text = document[:text] || document[:link]
      "#{view.indent_string(indent+1)}<a href='#{document[:link]}'>#{document_text}</a>\n"
    end
  end

  def render_array(view)
    document.map do |element|
      view.render_content(content_name, element, indent)
    end.join('')
  end

  def render_hash(view)
    view.paragraph(content_name, indent) do |indent|
      document.map { |key, value| view.render_content(key, value, indent) }.join('')
    end
  end


  def render_document(view)
    if document.is_a?(String)
      render_text(view)
    elsif document.is_a?(Hash)
      if document[:link]
        render_link(view)
      else
        render_hash(view)
      end
    elsif document.is_a?(Array)
      render_array(view)
    end
  end

end