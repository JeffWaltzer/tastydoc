class NewHtmlView
  def render(document, style)
    return_value=
      "<html>\n" +
        "  <head>\n" +
        "    <linkhref='tastydoc.css'rel='stylesheet'type='text/css'>\n" +
        "  </head>\n" +
        "  <body>\n"
    document.each do |key, value|
      return_value += render_text(value, style[key])
    end
    return_value +
      "  </body>\n" +
      "</html>\n"
  end

  def render_text(text, style)
    if style
      "<div class='#{style}'>#{text}</div>"
    else
      "<div>#{text}</div>"
    end
  end
end
