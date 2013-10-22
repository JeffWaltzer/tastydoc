require_relative "tasty_node"

class TastyArrayNode < TastyNode
  def initialize(document)
    super()
    @children= document.map {|value| TastyDocument.build(value)}
  end
end