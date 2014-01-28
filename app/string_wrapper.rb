class StringWrapper
  MAX_LINE_LENGTH = 72

  def initialize(indent_string)
    @indent_string= indent_string
  end

  def word_to_big(line, word)
    !line.empty? && line.length + word.length + 1 >= MAX_LINE_LENGTH
  end

  def wrap(s)
    result= ''
    words= s.split(/\s/).reverse
    until words.empty?
      line= ''
      until words.empty? || word_to_big(line, words[-1])
        line += (line.empty? ? @indent_string : ' ') + words.pop
      end
      result += line + "\n"
    end
    result
  end
end
