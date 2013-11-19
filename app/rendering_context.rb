class RenderingContext < Struct.new(:view, :content_name, :document, :level)

  def render_document
    send "render_#{document.class.name.downcase}"
  end


  def render_string
    view.paragraph(content_name, level) do
      view.string(document, level)
    end
  end

  def render_link
    view.paragraph(content_name, level) do
      url = document[:link]
      text = document[:text] || url
      view.link(text, url, level)
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
    view.paragraph(content_name, level) do |level|
      document.each { |key, value| render_subcontext(value, key, level) }
    end
  end

  def render_subcontext(value, key=nil, level= nil)
    key ||= content_name
    level ||= self.level
    sub_context= RenderingContext.new(view, key, value, level)
    sub_context.render_document
  end

end