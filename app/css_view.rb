class CssView
  def initialize(style)
    @results= []
    @style= style
  end

  def render(document, username)
    [
      css_sections(:bulleted_sections) {|section| bullet_css(section)} ,
      css_sections(:indented_sections) {|section| indent_css(section)}
    ].join
  end

  def css_sections(section_class)
    @style[section_class] && @style[section_class].map do |section|
      yield section
    end.join("\n")    || ''
  end

  def indent_css(section)
    "
        .#{section} {
            margin-left: 0.75cm;
          }
        "
  end

  def bullet_css(section)
    "
          .#{section} {
            margin-left: 0.75cm;
            display: list-item;
            list-style-type: circle;
          }
          "
  end
end

