require_relative 'tasty_string_node'
require_relative 'tasty_hash_node'
require_relative 'tasty_array_node'
require_relative 'tasty_link_node'

class TastyDocument

  def self.build(document)
    case (document)
      when String
        TastyStringNode
      when Hash
        document[:link] ? TastyLinkNode : TastyHashNode
      when Array
        TastyArrayNode
    end.new
  end

end