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

  def wrap(s)
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
    result + line.rstrip + "\n"
  end

  def line_prefix
    return_value= @indent_string
    if @bullet
          return_value += (@first ? '* ' : '  ')
          @first= false
    end
    return_value
  end
end
