require 'haml'

class HtmlView
  def initialize(document)
    @document= document
  end


  def section(contents, name = nil)
    if list_section?(contents)
      list_section(contents, "#{name}_item")
    elsif document_section?(contents)
      document_section(contents)
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

  def text_section(contents)
    haml_concat contents
  end

  def list_section(contents, class_name)
    contents.each do |sub_name|
      div(class_name, sub_name)
    end
  end

  def document_section(contents)
    if contents[:link]
      haml_tag("a", href: contents[:link]) do
        section(contents[:text])
      end
    else
      contents.each do |sub_name, sub_contents|
        div(sub_name, sub_contents)
      end
    end
  end

  def div(div_class, div_content)
    haml_tag(".#{div_class}") do
      section(div_content, div_class)
    end
  end


  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
            %link(rel="stylesheet" type="text/css" href="resume.css")
          %body
            - section @document
    END
    Haml::Engine.new(template).render(self, document: @document)
  end
end
