require 'haml'

class HtmlView
  def initialize(document)
    @document= document
  end

  SUBITEM_CLASS= {
    projects: :project,
    responsibilities: :responsibility,
    clients: :client,
    jobs: :job,
  }

  def section(contents, name = nil)
    if SUBITEM_CLASS[name]
      array_list(contents,SUBITEM_CLASS[name])
    elsif contents.is_a? Array
      array_list(contents, "#{name}_item")
    elsif contents.is_a? Hash
      hash_list(contents)
    else
      text(contents)
    end
  end

  def text(contents)
    haml_concat contents
  end

  def array_list(contents, class_name)
    contents.each do |sub_name|
      div(class_name, sub_name)
    end
  end

  def hash_list(contents)
    contents.each do |sub_name, sub_contents|
      div(sub_name, sub_contents)
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
