require_relative "rendering_context"

class HtmlView
  def initialize(style_sheet)
    @style_sheet= style_sheet
  end

  def render(document)
    context= RenderingContext.new(self, :document, document, 0)
    "<html>\n" +
      "  <head>\n" +
      "    <link href='tastydoc.css' rel='stylesheet' type='text/css'>\n" +
      "  </head>\n" +
      "  <body>\n" +
      context.render_document +
      "  </body>\n" +
      "</html>\n"
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
