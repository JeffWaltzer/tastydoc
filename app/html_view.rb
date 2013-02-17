class HtmlView
  def initialize(document)
    @document= document
  end

  def render
    <<-END.gsub(/^ {8}/, '')
        <html>
            <head>
            </head>
            <body>
              #{@document[:contact] && "<div class='contactinfo'>#{@document[:contact]}</div>"}
            </body>
        </html>
    END
   end
end
