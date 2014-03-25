require_relative '../../app/css_view'

require 'csspool'

describe CssView do
  describe "a style sheet with a bulleted section" do
    it 'generates a CSS class with display value of list-item' do
      css= CssView.new(bulleted_sections: [:our_bulleted_section]).render({})
      parsed_css= CSSPool::SAC::Parser.new.parse(css)
      puts parsed_css['.our_bulleted_section'].inspect
    end

    it 'generates a CSS class with a list-style-type of circle'
  end

  describe "an indented section" do
    it 'generates a CSS class with a margin-left'
  end

  describe "a seperated section" do
    it 'generates a CSS class with a margin-bottom'
  end

  describe "A nobreak section" do
    it 'generates a CSS class with an appropriate display style'
  end
end
