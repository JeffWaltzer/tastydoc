require_relative "rendering_context"

class HtmlView
  def initialize(style_sheet)
    @style_sheet= style_sheet
  end

  def render(document)
    context= RenderingContext.new(self, :document, document, 0)
    begin_document() +
        context.render_document +
        end_document()
  end

  def end_document
    "  </body>\n" +
        "</html>\n"
  end

  def begin_document
    "<html>\n" +
        "  <head>\n" +
        "    <link href='tastydoc.css' rel='stylesheet' type='text/css'>\n" +
        "  </head>\n" +
        "  <body>\n"
  end

  def link(document_text, document_link)
    "<a href='#{document_link}'>" +
        document_text +
        "</a>\n"
  end

  def indent(level)
    "  " * level
  end

  def begin_paragraph(style, level)
    "#{indent(level)}#{style ? "<div class='#{style}'>\n" : "<div>\n"}"
  end

  def end_paragraph(level)
    "#{indent(level)}</div>\n"
  end

  def paragraph(style, level)
    if style
      "#{begin_paragraph(style, level)}#{yield(level+1)}#{end_paragraph(level)}"
    else
      yield(level)
    end
  end
end
