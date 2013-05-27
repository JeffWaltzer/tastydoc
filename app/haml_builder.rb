require 'haml'

class HamlBuilder
  def initialize(name)
    @name= name
  end

  def section(div_class, div_content)
    haml_tag(".#{div_class}") do
      yield(div_content, div_class) if block_given?
    end
  end

  def nest
  end

  def unnest
  end

  def text(contents)
    haml_concat contents
  end

  def link(contents)
    haml_tag("a", href: contents[:link]) do
      yield contents[:text]
    end
  end

  def render(renderer)
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
            %link(rel="stylesheet" type="text/css" href="#{@name}.css")
          %body
            - renderer.render
    END

    Haml::Engine.new(template).render(self, renderer: renderer)
  end
end
