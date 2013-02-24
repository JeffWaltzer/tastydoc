require 'haml'

#ToDo: change name to HtmlView
class HamlView
  def initialize(document)
    @document= document
  end


  def generate_body
    @document.each do |section_name, section|
      section section_name, section
    end
  end

  def section(section_name, section)
    haml_tag ".#{section_name}" do
      if section.respond_to? :each
        section.each do |item_name, item_value|
          section_body(item_name, item_value)
        end
      else
        tag(".header", section_name.to_s.capitalize)
        tag(".text" , section)
      end
    end
  end

  def tag(tag, tag_content)
    haml_tag(tag) {haml_concat tag_content}
  end

  def section_body(item_name, item_value)
    if item_value
      case item_name 
      when :projects
        list(item_value, 'projects', 'project')
      when :responsibilities
        list(item_value, 'responsibilities', 'responsibility')
      else
        tag(".#{item_name}", item_value)
      end
    else
      section :job, item_name
    end
  end

  def list(item_value, parent_class, child_class)
    haml_tag(".#{parent_class}") do
      item_value.each do |item|
        tag(".#{child_class}", item)
      end
    end
  end


  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
          %body
            - generate_body
    END
    Haml::Engine.new(template).render(self, document: @document)
  end
end

