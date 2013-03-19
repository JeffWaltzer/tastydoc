class IndexView
  def initialize(document)
    @document= document
  end

  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
          %body
            - @document.each do |key, value|
              %div
                %a{href: "/" + key.to_s + ".html"}
                  =value[:contact][:name]
    END
    Haml::Engine.new(template).render(self, document: @document)
  end
end
