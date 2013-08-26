class Renderer
  def initialize(builder, content)
    @content= content
    @builder = builder
  end

  def render
    @content.each do |sub_name, sub_contents|
        @builder.section(sub_name, sub_contents)
    end
  end
end
