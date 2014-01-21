class StringWrapper
  MAX_LINE_LENGTH = 72

  def initialize(indent_string)
    @indent_string= indent_string
  end

  def word_fits(line, word)
    line.length + word.length + 1 < MAX_LINE_LENGTH
  end

  def wrap(s)
    result= ''
    words= s.split(/\s/).reverse
    while !words.empty?
      line= ''
      while !words.empty? && (line.empty? || word_fits(line, words[-1]))
        line += (line.empty? ? @indent_string : ' ') + words.pop
      end
      result += line + "\n"
    end
    result
  end
end
