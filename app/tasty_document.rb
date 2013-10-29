require_relative 'tasty_string_node'
require_relative 'tasty_hash_node'
require_relative 'tasty_array_node'
require_relative 'tasty_link_node'

class TastyDocument

  def self.build(raw_document)
    document_class=
        case (raw_document)
          when String
            TastyStringNode
          when Hash
            raw_document[:link] ? TastyLinkNode : TastyHashNode
          when Array
            TastyArrayNode
          else
            raise "unexpected document type: #{raw_document.class}"
        end
    document_class.new(raw_document)
  end
end