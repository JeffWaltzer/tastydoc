class Renderer
  def initialize(builder, content)
    @content= content
    @builder = builder
  end

  def render
    section(@content, nil, :top)
  end

  def section(contents, name = nil, top= nil)
    if list_section?(contents)
      list_section(contents, "#{name}_item")
    elsif link_section?(contents)
      link_section(contents)
    elsif document_section?(contents)
      document_section(contents, top)
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

  def link_section?(contents)
    contents.is_a?(Hash) && contents[:link]
  end

  def sub_document(sub_name, class_name)
    @builder.section(class_name, sub_name) do |content, clazz|
      section(content, clazz)
    end
  end

  def list_section(contents, class_name)
    @builder.nest
    contents.each do |sub_name|
      sub_document(sub_name, class_name)
    end
    @builder.unnest
  end

  def link_section(contents)
    @builder.link(contents) do |text|
      section(text)
    end
  end

  def document_section(contents, top)
    if contents[:header]
      sub_document(contents[:header], :header)
    end

    if contents[:contents]
      contents.each do |sub_name, sub_contents|
        sub_document(sub_contents, sub_name) unless sub_name == :header
      end
    else
      @builder.nest if !top
      contents.each do |sub_name, sub_contents|
        sub_document(sub_contents, sub_name) unless sub_name == :header
      end
      @builder.unnest if !top
    end
  end

  def text_section(contents)
    @builder.text(contents)
  end
end
