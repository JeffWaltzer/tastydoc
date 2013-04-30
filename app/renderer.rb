class Renderer
  def initialize(builder, content)
    @content= content
    @builder = builder
  end

  def render
    top_section(@content)
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

  def document_section(contents)
    if contents[:header]
      @builder.section(:header, contents[:header]) do |content, clazz|
        section(content, clazz)
      end
      sub_document(contents)
    else
      @builder.nest
      sub_document(contents)
      @builder.unnest
    end
  end

  def top_section(contents)
    if contents[:header]
      @builder.section(:header, contents[:header]) do |content, clazz|
        section(content, clazz)
      end
    end
    sub_document(contents)
  end

  def sub_document(contents)
    contents.each do |sub_name, sub_contents|
      unless sub_name == :header
        @builder.section(sub_name, sub_contents) do |content, clazz|
          section(content, clazz)
        end
      end
    end
  end

  def list_section(contents, class_name)
    @builder.nest
    contents.each do |sub_name|
      @builder.section(class_name, sub_name) do |content, clazz|
        section(content, clazz)
      end
    end
    @builder.unnest
  end

  def link_document(contents)
    @builder.link(contents) do |text|
      section(text)
    end
  end

  def text_document(contents)
    @builder.text(contents)
  end
end
