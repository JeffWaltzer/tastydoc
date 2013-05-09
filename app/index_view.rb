class IndexView
  def initialize(document)
    @document= document
  end

  #                 =value[:contact][:name]

  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
          %body
            - @document.each do |key, value|
              %div
                %span
                  =value[:contact][:name]
                %a{href: "/" + key.to_s + ".html"}
                  as html
                %a{href: "/" + key.to_s + ".txt"}
                  as text
    END
    Haml::Engine.new(template).render(self, document: @document)
  end
end
