require 'haml'

class HtmlView
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
        tag_content(".header", section_name.to_s.capitalize)
        tag_content(".text" , section)
      end
    end
  end

  def tag_content(tag, tag_content)
    haml_tag(tag) {haml_concat tag_content}
  end

  def section_body(item_name, item_value)
    case item_name 
    when :list
      list(item_value)
    else
      tag_content(".#{item_name}", item_value)
    end
  end

  def list(item_value)
    haml_tag(".list") do
      item_value.each do |item|
        tag_content(".list-item", item)
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

