require_relative "rendering_context"

class TextView
  def initialize(style_sheet)
    @style_sheet= style_sheet
    @accumulator = ''
  end

  def render(document)
    @accumulator = ''

    context= RenderingContext.new(self, :document, document, 0)
    context.render_document

    @accumulator
  end

  def indent(level)
  end

  def link(document_text, document_link,level)
    indent(level+1)
    @accumulator += "#{document_text} #{document_link}"
  end

  def begin_paragraph(style, level)
  end

  def end_paragraph(level)
  end

  def paragraph(style, level)
    begin_paragraph(style, level)
    yield(level+1)
    end_paragraph(level)
  end

  def string(s, level)
    @accumulator += "#{s}\n"
  end
end
