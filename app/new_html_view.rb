class NewHtmlView
  def render(document, style_sheet)
    return_value=
      "<html>\n" +
        "  <head>\n" +
        "    <linkhref='tastydoc.css'rel='stylesheet'type='text/css'>\n" +
        "  </head>\n" +
        "  <body>\n"
    return_value += render_content(document, :document, style_sheet)
    return_value +
      "  </body>\n" +
      "</html>\n"
  end

  def render_content(document, content_name, style_sheet)
    if document.is_a?(String)
      render_text(document, style_sheet[content_name])
    elsif document.is_a?(Hash)
      render_hash(document, content_name, style_sheet)
    end
  end

  def render_hash(document, content_name, style_sheet)
    return_value= ''
    if content_name && style_sheet[content_name]
      return_value += "<div class='#{style_sheet[content_name]}'>"
    end
    document.each do |key, value|
      return_value += render_content(value, key, style_sheet)
    end
    if content_name && style_sheet[content_name]
      return_value += "</div>"
    end
    return_value
  end

  def render_text(text, style)
    if style
      "<div class='#{style}'>#{text}</div>"
    else
      "<div>#{text}</div>"
    end
  end
end

