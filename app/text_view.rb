class TextView
  def initialize(document)
    @document=document
  end

  def render
    render_helper(@document).join("\n")
  end

  def render_helper(document, indentation= 0)
    if document.respond_to? :keys
      result= []
      document.keys.each do |key|
        subsection = document[key]
        if key == :dates
          result[-1] += "  " + subsection
        else
          result += render_helper(subsection, indentation)
        end
      end
      result.flatten
    elsif document.respond_to? :map
      document.map do |section|
        render_helper(section, indentation+2)
      end.flatten
    else
      [' ' * indentation + document]
    end
  end
end