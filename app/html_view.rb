class HtmlView
  def initialize(style_sheet)
    @style_sheet= style_sheet
  end

  def render(document)
    "<html>\n" +
      "  <head>\n" +
      "    <link href='tastydoc.css' rel='stylesheet' type='text/css'>\n" +
      "  </head>\n" +
      "  <body>\n" +
      render_content(:document, document) +
      "  </body>\n" +
      "</html>\n"
  end

  def render_content(content_name, document, indent= 0)
    if document.is_a?(String)
      render_text(document, content_name, indent)
    elsif document.is_a?(Hash)
      if document[:link]
        render_link(document,content_name, indent)
      else
        render_hash(document, content_name, indent)
      end
    elsif document.is_a?(Array)
      render_array(document, content_name, indent)
    end
  end

  def render_array(document, content_name, indent)
    document.map do |element|
      render_content(content_name, element, indent)
    end.join('')
  end

  def render_link(document, content_name, indent)
    div_wrap(content_name,indent) do
      "#{indent_string(indent+1)}<a href='#{document[:link]}'>#{document[:text]}</a>\n"
    end
  end

  def render_hash(document, content_name, indent)
    div_wrap(content_name, indent) do |indent|
      document.map { |key, value| render_content(key, value, indent) }.join('')
    end
  end

  def render_text(text, style, indent)
    "#{open_div(style, indent)}#{indent_string(indent+1)}#{text}\n#{close_div(indent)}"
  end

  def indent_string(indent)
    "  " * indent
  end

  def open_div(style, indent)
    "#{indent_string(indent)}#{style ? "<div class='#{style}'>\n" : "<div>\n"}"
  end

  def close_div(indent)
    "#{indent_string(indent)}</div>\n"
  end

  def div_wrap(style, indent)
    if style
      "#{open_div(style, indent)}#{yield(indent+1)}#{close_div(indent)}"
    else
      yield(indent)
    end
  end
end
