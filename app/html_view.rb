require 'haml'

class HtmlView
  def initialize(document)
    @document= document
  end


  def haml_section(section_name)
    section = @document[section_name]
    return unless section

    haml_tag ".#{section_name}" do
      if section.respond_to? :each
        section.each do |item_name, item_value|
          haml_section_body(item_name, item_value)
        end
      else
        haml_tag_content(".header", section_name.to_s.capitalize)
        haml_tag_content(".text" , section)
      end
    end
  end

  def haml_tag_content(tag, tag_content)
    haml_tag(tag) {haml_concat tag_content}
  end

  def haml_section_body(item_name, item_value)
    if item_value.respond_to? :each
      haml_list(item_value)
    else
      haml_tag_content(".#{item_name}", item_value)
    end
  end

  def haml_list(item_value)
    haml_tag(".list") do
      item_value.each do |item|
        haml_tag_content(".list-item", item)
      end
    end
  end


  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
          %body
            - @document.keys.each do |section_name|
              - haml_section section_name
    END
    Haml::Engine.new(template).render(self, document: @document)
  end
end

