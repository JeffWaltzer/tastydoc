class StringWrapper
  MAX_LINE_LENGTH = 72

  def initialize(indent_string)
    @indent_string= indent_string
  end

  def word_too_big(line, word)
    !line.empty? && line.length + word.length + 1 >= MAX_LINE_LENGTH
  end

  def wrap(s)
    result= ''
    line= ''
    s.split(/\s/).each do |word|
      if word_too_big(line, word)
        result += line + "\n"
        line= ''
      end
      line += (line.empty? ? @indent_string : ' ') + word
    end
    result + line + "\n"
  end
end
