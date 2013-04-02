class TextView
  def initialize(document)
    @document=document
    @indentation= 0
  end

  def render
    render_helper(@document).join("\n")
  end

  def section(document)
    result= []
    document.keys.each do |key|
      subsection = document[key]
      if key == :dates
        result[-1] += "  " + subsection
      else
        result += render_helper(subsection)
      end
    end
    result.flatten
  end

  def render_helper(document)
    if document.respond_to? :keys
      section(document)
    elsif document.respond_to? :map
      list(document)
    else
      text(document)
    end
  end

  def text(document)
    [' ' * @indentation + document]
  end

  def indent
    @indentation+=2
    rv=yield
    @indentation-=2
    rv
  end

  def list(document)
    document.map do |section|
      indent { render_helper(section) }
    end.flatten
  end
end
