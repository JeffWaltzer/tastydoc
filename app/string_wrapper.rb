class StringWrapper
  MAX_LINE_LENGTH = 72

  def initialize(indent_string, bullet)
    @indent_string= indent_string
    @bullet= bullet
    @first= true
  end

  def word_too_big(line, word)
    !line.empty? && line.length + word.length >= MAX_LINE_LENGTH
  end

  def wrap(s, nobreak= false)
    result= ''
    line= ''
    s.split(/\s/).each do |word|
      if word_too_big(line, word)
        result += line.rstrip + "\n"
        line= ''
      end
      line += line.empty? ? line_prefix : ' '
      line += word
    end
    result + line.rstrip + (nobreak ? ' ' : "\n")
  end

  def line_prefix
    if @first && @bullet
      @first= false
      @indent_string + '* '
    elsif @bullet
      @indent_string + '  '
    else
      @indent_string
    end
  end
end
