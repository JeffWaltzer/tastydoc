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

  def section(item_name, item_value)
    child_class= LIST_KEY[item_name]
    haml_tag(".#{child_class}") do
      guts(child_class, item_value)
    end
  end

  def section_body(item_name, item_value)
    haml_tag(".#{item_name}") do
      guts(item_name, item_value)
    end
  end

  def guts(item_name, item_value)
    if item_value.respond_to? :each
      item_value.each do |sub_item_name, sub_item_value|
        if sub_item_value
          haml_tag(".#{sub_item_name}") do
            guts(sub_item_name, sub_item_value)
          end
        else
          child_class= LIST_KEY[item_name]
          haml_tag(".#{child_class}") do
            guts(child_class, sub_item_name)
          end
        end
      end
    else
      haml_concat item_value
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

