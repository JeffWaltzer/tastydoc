require_relative "tasty_node"

class TastyStringNode < TastyNode
  def initialize(document)
    super()
    @text= document
  end
end