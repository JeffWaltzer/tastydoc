require_relative "tasty_node"

class TastyLinkNode < TastyNode
  def initialize(document)
    super()
    @text= document[:text]
    @link= document[:link]
  end

  def link
    @link
  end
end