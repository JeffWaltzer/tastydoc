require_relative '../../app/html_view'
require 'nokogiri'

describe "HtmlView#render" do
  it "should create an HTML document" do
    html= HtmlView.new({}).render
    html.gsub!(/\s+/, '')
    html.should == '<html><head></head><body></body></html>'
  end

  it "should render contact info as a div with class 'contactinfo'" do
    doc= Nokogiri::HTML(HtmlView.new({contact: "Joe Smith"}).render)
    doc.xpath("//div[@class='contactinfo']").should have(1).element
    doc.xpath("//div[@class='contactinfo']")[0].text.should == 'Joe Smith'
  end
end
