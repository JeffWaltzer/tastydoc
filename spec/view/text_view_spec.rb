require_relative '../spec_helper'
require_relative '../../app/text_view'


describe "TextView#render's result" do
  it "is a text document" do
    text= TextView.new({ }).render
    text.should == ''
  end
end

describe "A populated contact" do
  before do
    master_document= {
      contact: {
        name: "Joe Smith",
        email: 'joe@example.com'
      }
    }
    @doc= TextView.new(master_document).render.split("\n")
  end

  it "has two lines" do
    @doc.size.should == 2
  end

  it "has the correct contact name" do
    name= @doc.first
    name.strip.should == 'Joe Smith'
  end

  it "has the correct contact email" do
    email= @doc[1]
    email.strip.should == 'joe@example.com'
  end
end


describe "experience" do
  before do
    master_document= {
      experience: {
        header: 'Experience',
      },
      skills: {
        header: 'Skills',
        contents: ["Advanced BSing",
                   "Basic Coding"]
      }
    }
    @doc= TextView.new(master_document).render.split("\n")
  end

  it 'should have experience' do
    @doc[0].should=='Experience'
  end

  it 'should have experience' do
    @doc[1].should=='Skills'
  end

  it "has the Advanced BSing skill" do
    @doc[2].should == '  Advanced BSing'
  end

  it "has the Basic Coding skill" do
    @doc[3].should == '  Basic Coding'
  end

  it "Add more deeply nested hash next."
end
