class TextView
  def initialize(style)
    @results= []
    @indent= 0
  end

  def render(document)
    top_section(document)
    @results.join("\n")
  end

  def nest
    @indent += 1
  end

  def unnest
    @indent -= 1
  end

  def view_section(section_class, section_content)
    yield(section_content, section_class) if block_given?
  end

  def text(contents)
    @results << ('  ' * @indent + contents)
  end

  def link(contents)
    text("#{contents[:text]} (#{contents[:link]})")
  end

  def section(contents, name = nil)
    if list_section?(contents)
      list_section(contents, "#{name}_item")
    elsif link_document?(contents)
      link_document(contents)
    elsif document_section?(contents)
      document_section(contents)
    elsif text_document?(contents)
      text_document(contents)
    else
      raise "Unknown document type: #{contents.class.name}"
    end
  end

  def document_section?(contents)
    contents.is_a? Hash
  end

  def list_section?(contents)
    contents.is_a? Array
  end

  def link_document?(contents)
    contents.is_a?(Hash) && contents[:link]
  end

  def text_document?(contents)
    contents.is_a?(String)
  end


  def header_section(contents)
    view_section(:header, contents[:header]) do |content, clazz|
      section(content, clazz)
    end
    sub_document(contents)
  end


  def document_section(contents)
    if contents[:header]
      header_section(contents)
    else
      nest
      sub_document(contents)
      unnest
    end
  end

  def top_section(contents)
    sub_document(contents)
  end


  def sub_document(contents)
    contents.each do |sub_name, sub_contents|
      unless sub_name == :header
        view_section(sub_name, sub_contents) do |content, clazz|
          section(content, clazz)
        end
      end
    end
  end

  def list_section(contents, class_name)
    nest
    contents.each do |sub_name|
      view_section(class_name, sub_name) do |content, clazz|
        section(content, clazz)
      end
    end
    unnest
  end

  def link_document(contents)
    link(contents)
  end

  def text_document(contents)
    text(contents)
  end
end
