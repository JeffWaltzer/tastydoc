class CssBuilder
  SECTION_STYLES= {
    contact: [".contact {text-align: center;}",
              ".contact div {display: block;}"],
    summary: ".summary {margin-top: 0.25cm; margin-left:0.25cm}",
  }

  def initialize
    @results= []
  end

  def render(renderer)
    @results << ["body {margin-left: 3%; margin-right: 7%;}"]
    renderer.render
    @results.join('\n')
  end

  def section(section_class, section_content)
    section_style = SECTION_STYLES[section_class]
    if section_style
      @results += [section_style].flatten
    end
  end
end
