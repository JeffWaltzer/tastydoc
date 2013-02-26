require 'haml'

class HtmlView
  def initialize(document)
    @document= document
  end

  LIST_KEY= {
    projects: :project,
    responsibilities: :responsibility,
    clients: :client,
    jobs: :job,
  }

  def section(contents, name = nil)
    if contents.respond_to? :each
      list(contents, name)
    else
      text(contents)
    end
  end

  def text(contents)
    haml_concat contents
  end

  def list(contents, name)
    contents.each do |sub_name, sub_contents|
      div(
        LIST_KEY[name] || sub_name,
        sub_contents || sub_name
      )
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
