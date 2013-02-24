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

  def tag(tag, tag_content)
    haml_tag(tag) {haml_concat tag_content}
  end

  LIST_KEY= {
    projects: :project,
    responsibilities: :responsibility,
    clients: :client,
  }

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

  def section_body(item_name, item_value)
    if item_value
      haml_tag(".#{item_name}") do
#        if LIST_KEY[item_name]
        if item_value.respond_to? :each
          item_value.each do |item|
            if item.respond_to? :each
              section(LIST_KEY[item_name], item)
            else
              section_body(LIST_KEY[item_name], item)
            end
          end
        else
          haml_concat item_value
        end
      end
    else
      section :job, item_name
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

