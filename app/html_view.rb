require_relative "rendering_context"

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
    renderer= RenderingContext.new(content_name, document, indent)
    if document.is_a?(String)
      render_text(renderer)
    elsif document.is_a?(Hash)
      if document[:link]
        render_link(renderer)
      else
        render_hash(document, content_name, indent)
      end
    elsif document.is_a?(Array)
      render_array(document, content_name, indent)
    end
  end

  def render_array(content, content_name, indent)
    content.map do |element|
      render_content(content_name, element, indent)
    end.join('')
  end

  def render_link(renderer)
    div_wrap(renderer.content_name,renderer.indent) do
      document_text = renderer.document[:text] || renderer.document[:link]
      "#{indent_string(renderer.indent+1)}<a href='#{renderer.document[:link]}'>#{document_text}</a>\n"
    end
  end

  def render_hash(content, content_name, indent)
    div_wrap(content_name, indent) do |indent|
      content.map { |key, value| render_content(key, value, indent) }.join('')
    end
  end

  def render_text(renderer)
    "#{open_div(renderer.content_name, renderer.indent)}#{indent_string(renderer.indent+1)}#{renderer.document}\n#{close_div(renderer.indent)}"
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
