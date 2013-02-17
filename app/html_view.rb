require 'erb'

class HtmlView
  def initialize(document)
    @document= document
  end

  def render
    template= <<-END.gsub(/^ {8}/, '')
        <html>
            <head>
            </head>
            <body>
              <% contact= @document[:contact] %>
              <% if contact %>
                  <div class='contact'>
                      <% contact.each do |contact_item, item_value| %>
                          <div class='<%= contact_item %>'>
                              <%= item_value %>
                         </div>
                      <% end %>
                  </div>
              <% end %>
            </body>
        </html>
    END
    ERB.new(template).result(binding)
   end
end
