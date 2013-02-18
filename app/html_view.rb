require 'haml'

class HtmlView
  def initialize(document)
    @document= document
  end

  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
          %body
            - contact= document[:contact]
            - if contact
              .contact
                - contact.each do |contact_item, item_value|
                  %div{class: contact_item}=item_value
            - summary= document[:summary]
            - if summary
              .summary
                .header Summary
                .text=summary
    END
    Haml::Engine.new(template).render(Object.new, document: @document)
   end
end
