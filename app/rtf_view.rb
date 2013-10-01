require 'rtf'
class RtfView
  def initialize(style_sheet)
  end

  def render(document)
    RTF::Document.new(nil).to_rtf
  end

end