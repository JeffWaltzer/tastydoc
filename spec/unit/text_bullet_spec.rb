require_relative '../spec_helper'
require_relative '../../app/text_view'

describe 'It bullets' do


  check_rendered_document(
      {
          experience: {
              header: 'Experience',
          },
          skills_list: {
              header: 'Skills',
              skills: ["Advanced BSing",
                       "Basic Coding"]
          }
      },
      [
          'Experience',
          'Skills',
          '* Advanced BSing',
          '* Basic Coding'
      ],
      TextView,
      'fake_username',
      {
          bulleted_sections: [:skills]
      })
end

describe "it indents and bullets" do
  check_rendered_document(
      {
          experience: {
              header: 'Experience',
          },
          skills_list: {
              header: 'Skills',
              skills: ["Advanced BSing",
                       "Basic Coding"]
          }
      },
      [
          'Experience',
          'Skills',
          '  * Advanced BSing',
          '  * Basic Coding'
      ],
      TextView,
      'fake_user',
      {
          bulleted_sections: [:skills],
          indented_sections: [:skills]
      })
end

describe "it indents, wraps, and bullets" do
  check_rendered_document(
      {
          experience: {
              header: 'Experience',
          },
          skills_list: {
              header: 'Skills',
              skills: ["Advanced BSing to such a degree that you wouldn't believe it; I can barely believe it myself",
                       "Basic Coding"]
          }
      },
      [
          "Experience",
          "Skills",
          "  * Advanced BSing to such a degree that you wouldn't believe it; I can",
          "    barely believe it myself",
          "  * Basic Coding"
      ],
      TextView,
      'fake_user',
      {
          bulleted_sections: [:skills],
          indented_sections: [:skills]
      })
end

