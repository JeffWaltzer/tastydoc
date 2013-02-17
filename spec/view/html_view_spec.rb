require_relative '../../app/html_view'
require 'nokogiri'

describe "HtmlView#render's result" do
  it "is an HTML document" do
    html= HtmlView.new({}).render
    html.gsub!(/\s+/, '')
    html.should == '<html><head></head><body></body></html>'
  end
end

describe "The contact info div" do
  before do
    doc= Nokogiri::HTML(HtmlView.new({contact: {name: "Joe Smith"}}).render)
    @contactinfo= doc.xpath("//div[@class='contact']")
    @name= @contactinfo.xpath("//div[@class='name']")
  end
  
  it "exists" do
    @contactinfo.should have(1).element
  end

  it "has the correct contact name" do
    @name[0].text.strip.should == 'Joe Smith'
  end
end

describe "The contact info div" do
  before do
    doc= Nokogiri::HTML(HtmlView.new({contact: {}}).render)
    @contactinfo= doc.xpath("//div[@class='contact']")
    @name= @contactinfo.xpath("//div[@class='name']")
  end
  
  it "exists" do
    @contactinfo.should have(1).element
  end

  it "has the correct contact name" do
    @name.should have(0).elements
  end
end

