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
                      <% if contact[:name] %>
                          <div class='name'>
                              <%= contact[:name] %>
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
