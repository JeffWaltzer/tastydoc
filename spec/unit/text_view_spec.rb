require_relative '../spec_helper'
require_relative '../../app/text_view'

def check_text_document(document, expected, style_sheet)
  let :doc do
    TextView.new(style_sheet).render(document).split("\n")
  end

  it "has the correct number of lines" do
    doc.size.should == expected.size
  end

  expected.each_with_index do |line, index|
    it "renders '#{line}'" do
      doc[index].should == line
    end
  end
end


describe "TextView#render's result" do
  check_text_document({}, [], {})
end

describe "A populated contact" do
  check_text_document(
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
      {})
end


describe "experience" do
  check_text_document(
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
      indented_sections: [:skills])
end


describe "a document with a link" do
  check_text_document(
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
      indented_sections: [:contents])
end


describe "when handed a mailto link item" do
  check_text_document(
      {
          email: {
              link: "mailto:jeff@example.com",
              text: "example"
          }
      },
      ['example (mailto:jeff@example.com)'],
      {})
end

describe 'multi nesting' do
  check_text_document(
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
      indented_sections: [:needed])
end


describe "A more deeply nested hash." do
  check_text_document(
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
      indented_sections: [:employment_list, :projects])
end

describe "2-A more deeply nested hash." do
  check_text_document(
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
      indented_sections: [:employment_list, :projects])
end
