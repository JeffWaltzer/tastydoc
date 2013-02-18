require 'haml'

class HtmlView
  def initialize(document)
    @document= document
  end


  def document_section(section_name)
    section = @document[section_name]
    return unless section

    haml_tag '.' + section_name.to_s do
      if section.respond_to? :each
        section.each do |contact_item, item_value|
          haml_tag(".#{contact_item}") {haml_concat item_value }
        end
      else
        haml_tag(".header") { haml_concat section_name.to_s.capitalize }
        haml_tag(".text") { haml_concat section }
      end
    end
  end


  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
          %body
            - document_section :contact
            - document_section :summary
            - document_section :education
    END
    Haml::Engine.new(template).render(self, document: @document)
  end
end

