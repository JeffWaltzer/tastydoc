class TextView
  def initialize(document)
    @document = document
  end

  def render
    results=[]
    @document.each do |section, contents|
      results += contents.values
    end
    results.join("\n")
  end
end