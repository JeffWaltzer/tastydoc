class Renderer
  def initialize(builder, content)
    @content= content
    @builder = builder
  end

  def section(contents= @content, name = nil)
    if list_section?(contents)
      list_section(contents, "#{name}_item")
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

  def list_section(contents, class_name)
    contents.each do |sub_name|
      @builder.section(class_name, sub_name) do |content, clazz|
        section(content, clazz)
      end
    end
  end

  def document_section(contents)
    if contents[:link]
      @builder.link(contents) { |text| section(text) }
    else
      contents.each do |sub_name, sub_contents|
        @builder.section(sub_name, sub_contents) do |content, clazz|
          section(content, clazz)
        end
      end
    end
  end
end