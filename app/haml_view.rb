require 'haml'

#ToDo: change name to HtmlView
class HamlView
  def initialize(document)
    @document= document
  end


  def generate_body
    @document.each do |section_name, section|
      haml_tag ".#{section_name}" do
        if section.respond_to? :each
          section.each do |item_name, item_value|
            section_body(item_name, item_value)
          end
        end
      end
    end
  end

  def tag(tag, tag_content)
    haml_tag(tag) {haml_concat tag_content}
  end

  LIST_KEY= {
    projects: :project,
    responsibilities: :responsibility,
    clients: :client,
    jobs: :job,
  }

  def section(item_name, item)
    child_class= LIST_KEY[item_name]
    haml_tag(".#{child_class}") do
      if item.respond_to? :each
        item.each do |sub_item_name, sub_item_value|
          section_body(sub_item_name, sub_item_value)
        end
      else
        haml_concat item
      end
    end
  end

  def section_body(item_name, item_value)
    haml_tag(".#{item_name}") do
      if item_value.respond_to? :each
        item_value.each do |item|
          section(item_name, item)
        end
      else
        haml_concat item_value
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

