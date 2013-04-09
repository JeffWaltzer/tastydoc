class Renderer
  def initialize(builder, content)
    @content= content
    @builder = builder
  end

  def render
    section(@content)
  end

  def section(contents, name = nil)
    if list_section?(contents)
      list_section(contents, "#{name}_item")
    elsif link_section?(contents)
      link_section(contents)
    elsif document_section?(contents)
      document_section(contents)
    else
      @builder.text(contents)
    end
  end

  def document_section?(contents)
    contents.is_a? Hash
  end

  def list_section?(contents)
    contents.is_a? Array
  end

  def link_section?(contents)
    contents.is_a?(Hash) && contents[:link]
  end

  def sub_document(sub_name, class_name)
    @builder.section(class_name, sub_name) do |content, clazz|
      section(content, clazz)
    end
  end

  def list_section(contents, class_name)
    contents.each do |sub_name|
      sub_document(sub_name, class_name)
    end
  end

  def link_section(contents)
    @builder.link(contents) { |text| section(text) }
  end

  def document_section(contents)
    contents.each do |sub_name, sub_contents|
      sub_document(sub_contents, sub_name)
    end
  end
end