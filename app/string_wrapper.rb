class StringWrapper
  MAX_LINE_LENGTH = 72

  def initialize(indent_string)
    @indent_string= indent_string
  end

  def word_fits(line, word)
    word.length + line.length < MAX_LINE_LENGTH ||
        word.length >= MAX_LINE_LENGTH
  end

  def wrap(s)
    result= ''

    line = @indent_string
    s.split(/\s/).each do |word|
      if !word_fits(line, word)
        result += line.rstrip + "\n"
        line = @indent_string
      end
      line += word + ' '
    end

    result + ((line.strip == '') ? '' : line.rstrip + "\n")
  end
end
