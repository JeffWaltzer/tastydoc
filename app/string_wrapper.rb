class StringWrapper
  MAX_LINE_LENGTH = 72

  def initialize(indent_string)
    @indent_string= indent_string
  end

  def wrap(s)
    result= ''
    words= s.split(/\s/)
    while !words.empty?
      line= @indent_string
      while !words.empty? && (line.strip.empty? || line.length + words[0].length + 1 < MAX_LINE_LENGTH)
        if !line.strip.empty?
          line += ' '
        end
        line += words[0]
        words= words[1..-1]
      end
      result += line + "\n"
    end
    result
  end
end
