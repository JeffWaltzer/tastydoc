class RenderingContext < Struct.new(:content_name, :document, :indent)
  def render_text(view)
    "#{view.begin_paragraph(content_name, indent)}#{view.indent_string(indent+1)}#{document}\n#{view.end_paragraph(indent)}"
  end

  def render_link(view)
    view.div_wrap(content_name,indent) do
      document_text = document[:text] || document[:link]
      "#{view.indent_string(indent+1)}<a href='#{document[:link]}'>#{document_text}</a>\n"
    end
  end

  def render_array(view)
    document.map do |element|
      view.render_content(content_name, element, indent)
    end.join('')
  end
end