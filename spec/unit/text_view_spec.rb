require_relative '../spec_helper'
require_relative '../../app/text_view'

#ToDo: change arguments to an option hash

def check_text_document(expected, master_document, style_sheet={})
  let :doc do
    TextView.new(style_sheet).render(master_document).split("\n")
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
  check_text_document([], {})

  it "is a text document" do
    doc.should be_empty
  end
end

describe "A populated contact" do
  check_text_document(
      [
          'Joe Smith',
          'joe@example.com'
      ],
      {
          contact: {
              name: "Joe Smith",
              email: 'joe@example.com'
          }
      }
  )
end


describe "experience" do
  check_text_document(
      [
          'Experience',
          'Skills',
          '  Advanced BSing',
          '  Basic Coding'
      ],
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
      indented_sections: [:skills]
  )
end


describe "a document with a link" do
  check_text_document(
      [
          'Pages',
          '  An example (http://example.com)'
      ],
      {
          pages: {
              header: 'Pages',
              contents: [{
                             link: 'http://example.com',
                             text: 'An example'
                         }],
          }},
      indented_sections: [:contents]
  )
end


describe "when handed a mailto link item" do
  check_text_document(
      ['example (mailto:jeff@example.com)'],
      {
          email: {
              link: "mailto:jeff@example.com",
              text: "example"
          }
      }
  )
end

describe 'multi nesting' do
  check_text_document(
      [
          'text',
          '  YES',
          'FUN',
      ],
      {
          garage: {
              car: "text",
              gas: {needed: 'YES'},
              bicycle: 'FUN'
          }
      },
      indented_sections: [:needed]
  )
end


describe "A more deeply nested hash." do
  check_text_document(
      [
          "Employment History",
          "  Zed",
          "    one",
          "    two",
          "  Zork",
          "    xyzzy",
          "    froboz",
      ],
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
      indented_sections: [:employment_list, :projects]
  )
end

describe "2-A more deeply nested hash." do
  check_text_document(
      [
          '  Zed',
          '    one',
          '    two',
          '    three',
          '  Zork',
          '    xyzzy',
          '    froboz'
      ],
      {employment_list: [
          {header: 'Zed',
           projects: %w{one two three}
          },
          {header: 'Zork',
           projects: %w{xyzzy froboz}
          },
      ]},
      indented_sections: [:employment_list, :projects]
  )
end
