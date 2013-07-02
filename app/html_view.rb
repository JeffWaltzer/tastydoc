class HtmlView
  def render(document, style_sheet)
    @style_sheet= style_sheet
    "<html>\n" +
      "  <head>\n" +
      "    <linkhref='tastydoc.css'rel='stylesheet'type='text/css'>\n" +
      "  </head>\n" +
      "  <body>\n" +
      render_content(:document, document) +
      "  </body>\n" +
      "</html>\n"
  end

  def render_content(content_name, document)
    if document.is_a?(String)
      render_text(document, @style_sheet[content_name])
    elsif document.is_a?(Hash)
      render_hash(document, content_name)
    elsif document.is_a?(Array)
      render_array(document, content_name)
    end
  end

  def render_array(document, content_name)
    document.map do |element|
      render_content(content_name, element)
    end.join('')
  end

  def render_hash(document, content_name)
    div_wrap(content_name && @style_sheet[content_name]) do
      document.map { |key, value| render_content(key, value) }.join('')
    end
  end

  def open_div(style)
    style ? "<div class='#{style}'>" : "<div>"
  end

  def div_wrap(style)
    if style
      "#{open_div(style)}#{yield}</div>"
    else
      yield
    end
  end

  def render_text(text, style)
    open_div(style) + text + "</div>"
  end
end
