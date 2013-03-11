class TextView
  def initialize(document)
    @document=document
  end

  def render
    contact = @document[:contact]
    contact ? contact.values.join("\n") : ''
  end
end