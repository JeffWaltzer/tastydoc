require_relative '../spec_helper'
require_relative '../../app/text_view'

describe "TextView#render's result" do
  check_rendered_document({}, [], TextView)
end

describe "A populated contact" do
  check_rendered_document(
      {
          contact: {
              name: "Joe Smith",
              email: 'joe@example.com'
          }
      },
      [
          'Joe Smith',
          'joe@example.com'
      ],
      TextView)
end


describe "experience" do
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
          '  Advanced BSing',
          '  Basic Coding'
      ],
      TextView,
      {
          indented_sections: [:skills]
      })
end


describe "a document with a link" do
  check_rendered_document(
      {
          pages: {
              header: 'Pages',
              contents: [{
                             link: 'http://example.com',
                             text: 'An example'
                         }],
          }},
      [
          'Pages',
          '  An example (http://example.com)'
      ],
      TextView,
      {
          indented_sections: [:contents]
      })
end


describe "when handed a mailto link item" do
  check_rendered_document(
      {
          email: {
              link: "mailto:jeff@example.com",
              text: "example"
          }
      },
      ['example (mailto:jeff@example.com)'],
      TextView)
end

describe 'multi nesting' do
  check_rendered_document(
      {
          garage: {
              car: "text",
              gas: {needed: 'YES'},
              bicycle: 'FUN'
          }
      },
      [
          'text',
          '  YES',
          'FUN',
      ],
      TextView,
      {
          indented_sections: [:needed]
      })
end


describe "A more deeply nested hash." do
  check_rendered_document(
      {
          header: 'Employment History',
          employment_list: [
              {
                  header: 'Zed',
                  projects: %w{one two}
              },
              {
                  header: 'Zork',
                  projects: %w{xyzzy froboz}
              },
          ]},
      [
          "Employment History",
          "  Zed",
          "    one",
          "    two",
          "  Zork",
          "    xyzzy",
          "    froboz",
      ],
      TextView,
      {
          indented_sections: [:employment_list, :projects]
      })
end

describe "2-A more deeply nested hash." do
  check_rendered_document(
      {
          employment_list: [
              {header: 'Zed',
               projects: %w{one two three}
              },
              {header: 'Zork',
               projects: %w{xyzzy froboz}
              },
          ]},
      [
          '  Zed',
          '    one',
          '    two',
          '    three',
          '  Zork',
          '    xyzzy',
          '    froboz'
      ],
      TextView,
      {
          indented_sections: [:employment_list, :projects]
      })
end
