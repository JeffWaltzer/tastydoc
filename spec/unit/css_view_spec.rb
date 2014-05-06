require_relative '../../app/css_view'

require 'csspool'

def should_generate_css(expected_selector, expected_rules, tasty_style_sheet)
  expected_rules.each_with_index do |expected, index|
    it "generates #{expected} sets for #{expected_selector}" do
      css= CssView.new(tasty_style_sheet).render({}, 'junk_username')
      pending "css is missing" if css.empty?
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
    should_generate_css('.our_seperated_section',
                        [
                         "  margin-bottom: 1em;",
                        ],
                        {seperated_sections: [:our_seperated_section]}
    )
  end

  describe "A nobreak section generates a CSS class with an appropriate display style" do
    should_generate_css('.our_nobreak_section',
                        [
                            "  display: inline;",
                        ],
                        {nobreak_sections: [:our_nobreak_section]}
    )

    should_generate_css('.our_nobreak_section+div',
                        [
                            "  display: inline;",
                        ],
                        {nobreak_sections: [:our_nobreak_section]}
    )

  end
end
