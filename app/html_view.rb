require_relative "rendering_context"

class HtmlView
  def initialize(style_sheet)
    @style_sheet= style_sheet
    @accumulator = ''
  end

  def self.wrap_page(body)
    [
        "<html>",
        "  <head>",
        "    <link href='tastydoc.css' rel='stylesheet' type='text/css'>",
        "  </head>",
        "  <body>",
        "    <div class='document'>"
    ] +
    body.map { |line| ' '*6 + line } +
    [
        "    </div>",
        "  </body>",
        "</html>"
    ]
  end


  def render(document)
    @accumulator = ''
    context= RenderingContext.new(self, :document, document, 2)
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
    @accumulator +=
        "<html>\n" +
            "  <head>\n" +
            "    <link href='tastydoc.css' rel='stylesheet' type='text/css'>\n" +
            "  </head>\n" +
            "  <body>\n"
  end

  def link(document_text, document_link, level, style)
    indent(level+1)
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

  def string(s, level, style)
    indent(level+1)
    @accumulator += "#{s}\n"
  end
end
