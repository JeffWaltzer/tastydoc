require_relative "rendering_context"

class TextView
  def initialize(style_sheet)
    @style_sheet= style_sheet
    @accumulator = ''
    @last_level= nil
    @display_indent= 0
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
    string("#{document_text} (#{document_link})", level)
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

    if @last_level && level > @last_level
      @display_indent += 1
    elsif @last_level && level < @last_level && @display_indent > 0
      @display_indent -= 1
    end
    @last_level= level
    @accumulator += "#{'  ' * @display_indent}#{s}\n"
  end
end
