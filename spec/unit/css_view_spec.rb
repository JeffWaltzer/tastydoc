require_relative '../../app/css_view'

require 'csspool'

def should_generate_css(expected_selector, expected_rules, tasty_style_sheet)
  expected_rules.each_with_index do |expected, index|
    it "generates #{expected} sets for #{expected_selector}" do
      css= CssView.new(tasty_style_sheet).render({})
      parsed_css= CSSPool::SAC::Parser.new.parse(css)
      bulleted = parsed_css[expected_selector]
      bulleted.first.should be
      bulleted.first.declarations[index].to_css.should == expected
    end
  end
end

describe CssView do
  describe "a style sheet with a bulleted section" do

    should_generate_css(
        '.our_bulleted_section',
        [
            "  margin-left: 0.75cm;",
            "  display: list-item;",
            "  list-style-type: circle;"
        ],
        {bulleted_sections: [:our_bulleted_section]}
    )
  end

  describe "an indented section" do

    should_generate_css(
        '.our_indented_section',
        [
            "  margin-left: 0.75cm;",
        ],
        {indented_sections: [:our_indented_section]}
    )

  end

  describe "a seperated section" do
    it 'generates a CSS class with a margin-bottom'
  end

  describe "A nobreak section" do
    it 'generates a CSS class with an appropriate display style'
  end
end
