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
              <% if @document[:contact] %>
                  <div class='contactinfo'>
                      <%= @document[:contact] %>
                  </div>
              <% end %>
            </body>
        </html>
    END
    ERB.new(template).result(binding)
   end
end
