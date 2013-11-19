class RenderingContext < Struct.new(:view, :content_name, :document, :indent)

  def render_document
    send "render_#{document.class.name.downcase}"
  end


  def render_string
    view.paragraph(content_name, indent) do
      view.string(document, indent)
    end
  end

  def render_link
    view.paragraph(content_name, indent) do
      url = document[:link]
      text = document[:text] || url
      view.link(text, url, indent)
    end
  end

  def render_array
    document.each { |element| render_subcontext(element) }
  end

  def render_hash
    if document[:link]
      render_link
    else
      render_hash_default
    end
  end

  def render_hash_default
    view.paragraph(content_name, indent) do |indent|
      document.each { |key, value| render_subcontext(value, key, indent) }
    end
  end

  def render_subcontext(value, key=nil, indent= nil)
    key ||= content_name
    indent ||= self.indent
    sub_context= RenderingContext.new(view, key, value, indent)
    sub_context.render_document
  end

end