require_relative '../../app/html_view'
require 'nokogiri'

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
    doc= Nokogiri::HTML(HtmlView.new(master_document).render)
    @contactinfo= doc.xpath("//div[@class='contact']")
    @name= @contactinfo.xpath("//div[@class='name']")
    @email= @contactinfo.xpath("//div[@class='email']")
  end
  
  it "exists" do
    @contactinfo.should have(1).element
  end

  it "has the correct contact name" do
    @name.should have(0).elements
  end

  it "has the correct contact email" do
    @email.should have(0).elements
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
    doc= Nokogiri::HTML(HtmlView.new(master_document).render)
    @contactinfo= doc.xpath("//div[@class='contact']")
    @name= @contactinfo.xpath("//div[@class='name']")
    @email= @contactinfo.xpath("//div[@class='email']")
  end
  
  it "exists" do
    @contactinfo.should have(1).element
  end

  it "has the correct contact name" do
    @name[0].text.strip.should == 'Joe Smith'
  end

  it "has the correct contact email" do
    @email[0].text.strip.should == 'joe@example.com'
  end
end

describe "A summary" do
  before do
    master_document= {summary: 'I have done lots of stuff.'}
    doc= Nokogiri::HTML(HtmlView.new(master_document).render)
    @summary= doc.xpath("//div[@class='summary']")
  end
  
  it "exists" do
    @summary.should have(1).element
  end

  describe "header" do
    before do
      @summary_header= @summary.xpath("//div[@class='header']")
    end

    it "exists" do
      @summary_header.should have(1).element
    end

    it "has the correct text" do
      @summary_header.text.strip.should == 'Summary'
    end
  end

  describe "text" do
    before do
      @summary_text= @summary.xpath("//div[@class='text']")
    end

    it "exists" do
      @summary_text.should have(1).element
    end

    it "has the correct text" do
      @summary_text.text.strip.should == 'I have done lots of stuff.'
    end
  end
end

