class IndexView
  def initialize(document)
  end

  def render
    template= <<-END.gsub(/^ {8}/, '')
        %html
          %head
          %body
    END
    Haml::Engine.new(template).render(self, document: @document)
  end
end
