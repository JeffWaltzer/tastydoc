require_relative '../../app/html_view'
require 'nokogiri'

def xpath_for(parent, *children)
  children.inject("//div[@class='#{parent}']") do |path_so_far, child|
    path_so_far + "/div[@class='#{child}']"
  end
end


describe "HtmlView#render's result" do
  it "is an HTML document" do
    html= HtmlView.new({}).render
    html.gsub!(/\s+/, '')
    html.should == '<html><head></head><body></body></html>'
  end
end

describe "An empty contact" do
  before do
    master_document= {contact: {}}
    @doc= Nokogiri::HTML(HtmlView.new(master_document).render)
  end
  
  it "exists" do
    contact= @doc.xpath(xpath_for('contact'))
    contact.should have(1).element
  end

  it "has the correct contact name" do
    name= @doc.xpath(xpath_for('contact', 'name'))
    name.should have(0).elements
  end

  it "has the correct contact email" do
    email= @doc.xpath(xpath_for('contact', 'email'))
    email.should have(0).elements
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
    @doc= Nokogiri::HTML(HtmlView.new(master_document).render)
  end
  
  it "exists" do
    contact= @doc.xpath(xpath_for('contact'))
    contact.should have(1).element
  end

  it "has the correct contact name" do
    name= @doc.xpath(xpath_for('contact', 'name'))
    name[0].text.strip.should == 'Joe Smith'
  end

  it "has the correct contact email" do
    email= @doc.xpath(xpath_for('contact', 'email'))
    email[0].text.strip.should == 'joe@example.com'
  end
end

def should_have_document_section(master_document, parent_node, child_expectations)
  describe parent_node do
    before do
      @doc= Nokogiri::HTML(HtmlView.new(master_document).render)
    end
    
    it "exists" do
      summary= @doc.xpath(xpath_for(parent_node))
      summary.should have(1).element
    end

    child_expectations.each do |child_name, child_expected_value|
      should_have_child(parent_node, child_name.to_s, child_expected_value)
    end
  end
end

def should_have_child(parent_node, child_node, expected_text)
  describe child_node do
    before do
      @header= @doc.xpath(xpath_for(parent_node, child_node))
    end

    it "exists" do
      @header.should have(1).element
    end

    it "has the correct text" do
      @header.text.strip.should == expected_text
    end
  end
end

should_have_document_section({summary: 'I have done lots of stuff.'},
                             'summary',
                             header: 'Summary',
                             text: 'I have done lots of stuff.')

