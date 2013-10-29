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
    context= RenderingContext.new(content_name, document, indent)
    if document.is_a?(String)
      render_text(context)
    elsif document.is_a?(Hash)
      if document[:link]
        render_link(context)
      else
        render_hash(document, content_name, indent)
      end
    elsif document.is_a?(Array)
      render_array(context)
    end
  end

  def render_array(context)
    context.document.map do |element|
      render_content(context.content_name, element, context.indent)
    end.join('')
  end

  def render_link(context)
    div_wrap(context.content_name,context.indent) do
      document_text = context.document[:text] || context.document[:link]
      "#{indent_string(context.indent+1)}<a href='#{context.document[:link]}'>#{document_text}</a>\n"
    end
  end

  def render_hash(content, content_name, indent)
    div_wrap(content_name, indent) do |indent|
      content.map { |key, value| render_content(key, value, indent) }.join('')
    end
  end

  def render_text(context)
    "#{open_div(context.content_name, context.indent)}#{indent_string(context.indent+1)}#{context.document}\n#{close_div(context.indent)}"
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
