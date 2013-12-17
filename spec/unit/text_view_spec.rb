require_relative '../spec_helper'
require_relative '../../app/text_view'

def make_text_document(master_document, style_sheet={})
  TextView.new(style_sheet).render(master_document).split("\n")
end


describe "TextView#render's result" do
  let :doc do
    make_text_document({})
  end

  it "is a text document" do
    doc.should be_empty
  end
end

describe "A populated contact" do
  let :doc do
    make_text_document(
        contact: {
            name: "Joe Smith",
            email: 'joe@example.com'
        }
    )
  end

  it "has two lines" do
    doc.size.should == 2
  end

  it "has the correct contact name" do
    doc[0].should == 'Joe Smith'
  end

  it "has the correct contact email" do
    doc[1].should == 'joe@example.com'
  end
end


describe "experience" do
  let :doc do
    make_text_document(
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

  it 'should have experience' do
    doc[0].should=='Experience'
  end

  it 'should have experience' do
    doc[1].should=='Skills'
  end

  it "has the Advanced BSing skill" do
    doc[2].should == '  Advanced BSing'
  end

  it "has the Basic Coding skill" do
    doc[3].should == '  Basic Coding'
  end
end


describe "a document with a link" do
  let :doc do
    make_text_document(
        {pages: {
            header: 'Pages',
            contents: [{
                           link: 'http://example.com',
                           text: 'An example'
                       }],
        }},
        indented_sections: [:contents]
    )
  end

  it "has a header" do
    doc[0].should == 'Pages'
  end

  it "has a rendered link" do
    doc[1].should == '  An example (http://example.com)'
  end
end

describe "when handed a mailto link item" do
  let :doc do
    make_text_document(
        {email: {
            link: "mailto:jeff@example.com",
            text: "example"
        }}
    )
  end

  it "renders" do
    doc[0].should == 'example (mailto:jeff@example.com)'
  end
end

describe 'multi nesting' do
  let :doc do
    make_text_document(
        {garage: {
            car: "text",
            gas: {needed: 'YES'},
            bicycle: 'FUN'
        }},
        indented_sections: [:needed]
    )
  end

  it { doc[0].should == 'text' }
  it { doc[1].should == '  YES' }
  it { doc[2].should == 'FUN' }

end

describe "A more deeply nested hash." do
  let :doc do
    make_text_document(
        {header: 'Employment History',
         employment_list: [
             {header: 'Zed',
              projects: %w{one two}
             },
             {header: 'Zork',
              projects: %w{xyzzy froboz}
             },
         ]},
        indented_sections: [:employment_list, :projects]
    )
  end

  it "renders" do
    doc[0].should == "Employment History"
  end

  it "renders" do
    doc[1].should == "  Zed"
  end

  it "renders" do
    doc[2].should == "    one"
  end

  it "renders" do
    doc[3].should == "    two"
  end

  it "renders" do
    doc[4].should == "  Zork"
  end

  it "renders" do
    doc[5].should == "    xyzzy"
  end

  it "renders" do
    doc[6].should == "    froboz"
  end
end


describe "2-A more deeply nested hash." do
  let :doc do
    make_text_document(
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

  [
      '  Zed',
      '    one',
      '    two',
      '    three',
      '  Zork',
      '    xyzzy',
      '    froboz'
  ].each_with_index do |line, index|
    it "renders '#{line}'" do
      doc[index].should == line
    end
  end
end
