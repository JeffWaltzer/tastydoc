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
      context.render_text(self)
    elsif document.is_a?(Hash)
      if document[:link]
        context.render_link(self)
      else
        render_hash(context)
      end
    elsif document.is_a?(Array)
      context.render_array(self)
    end
  end

  def render_hash(context)
    div_wrap(context.content_name, context.indent) do |indent|
      context.document.map { |key, value| render_content(key, value, indent) }.join('')
    end
  end

  def indent_string(indent)
    "  " * indent
  end

  def begin_paragraph(style, indent)
    "#{indent_string(indent)}#{style ? "<div class='#{style}'>\n" : "<div>\n"}"
  end

  def end_paragraph(indent)
    "#{indent_string(indent)}</div>\n"
  end

  def div_wrap(style, indent)
    if style
      "#{begin_paragraph(style, indent)}#{yield(indent+1)}#{end_paragraph(indent)}"
    else
      yield(indent)
    end
  end
end
