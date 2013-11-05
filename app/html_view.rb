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
    context.render_document(self)
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

  def paragraph(style, indent)
    if style
      "#{begin_paragraph(style, indent)}#{yield(indent+1)}#{end_paragraph(indent)}"
    else
      yield(indent)
    end
  end
end
