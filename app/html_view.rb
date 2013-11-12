require_relative "rendering_context"

class HtmlView
  def initialize(style_sheet)
    @style_sheet= style_sheet
    @accumulator = ''
  end

  def render(document)
    @accumulator = ''
    context= RenderingContext.new(self, :document, document, 0)
    begin_document
    context.render_document
    end_document
    @accumulator
  end

  def end_document
    @accumulator += "  </body>\n" +
        "</html>\n"
  end

  def begin_document
    @accumulator += "<html>\n" +
        "  <head>\n" +
        "    <link href='tastydoc.css' rel='stylesheet' type='text/css'>\n" +
        "  </head>\n" +
        "  <body>\n"
  end

  def link(document_text, document_link)
    @accumulator += "<a href='#{document_link}'>" +
        document_text +
        "</a>\n"
  end

  def indent(level)
    @accumulator += "  " * level
  end

  def begin_paragraph(style, level)
    indent(level)
    @accumulator += "#{style ? "<div class='#{style}'>" : "<div>"}\n"
  end

  def end_paragraph(level)
    indent(level)
    @accumulator += "</div>\n"
  end

  def paragraph(style, level)
      begin_paragraph(style, level)
      yield(level+1)
      end_paragraph(level)
  end

  def string(s)
    @accumulator += "#{s}\n"
  end
end
