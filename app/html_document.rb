
class HtmlDocument
  def initialize(content)
    @content= content
  end

  def builder=(builder)
    @builder=builder
  end

  def section(contents= @content, name = nil)
    if list_section?(contents)
      list_section(contents, "#{name}_item")
    elsif document_section?(contents)
      document_section(contents)
    else
      text_section(contents)
    end
  end

  def document_section?(contents)
    contents.is_a? Hash
  end

  def list_section?(contents)
    contents.is_a? Array
  end

  def text_section(contents)
    @builder.concat contents
  end

  def list_section(contents, class_name)
    contents.each do |sub_name|
      div(class_name, sub_name)
    end
  end

  def document_section(contents)
    if contents[:link]
      @builder.tag("a", href: contents[:link]) do
        section(contents[:text])
      end
    else
      contents.each do |sub_name, sub_contents|
        div(sub_name, sub_contents)
      end
    end
  end

  def div(div_class, div_content)
    @builder.tag(".#{div_class}") do
      section(div_content, div_class)
    end
  end

end