require_relative "rendering_context"

class TextView
  def initialize(style_sheet)
    @accumulator = ''
    @last_level= nil
    @display_indent= 0
    @indented_sections= style_sheet[:indented_sections] || []
  end

  def self.wrap_page(body)
    body
  end

  def render(document)
    @accumulator = ''

    context= RenderingContext.new(self, :document, document, 0)
    context.render_document

    @accumulator
  end

  def indent(level)
  end

  def link(document_text, document_link, level)
    string("#{document_text} (#{document_link})", level)
  end

  def begin_paragraph(style)
    if @indented_sections.include?(style)
      @display_indent += 1
    end
  end

  def end_paragraph(style)
    if @indented_sections.include?(style)
      @display_indent -= 1
    end
  end

  def paragraph(style, level)
    begin_paragraph(style)
    yield(level)
    end_paragraph(style)
  end

  def string(s, level)
    max_length= 72

    words = s.split(/\s/)
    word_index= 0
    while word_index < words.size
      line = '  ' * @display_indent
      while word_index < words.size &&
          (line + words[word_index]).length < max_length
        line += words[word_index] + ' '
        word_index += 1
      end
      @accumulator += line.rstrip + "\n"
    end
  end
end
