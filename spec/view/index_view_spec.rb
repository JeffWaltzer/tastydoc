require_relative '../spec_helper'
require_relative '../../app/index_view'
# require 'nokogiri'
# require 'pry'

describe "IndexView#render's result" do
  it "is an HTML document" do
    html= IndexView.new({}).render
    html.gsub!(/\s+/, '')
    html.should == "<html><head></head><body></body></html>"
  end
end

describe "IndexView for a database with two documents" do
  before do
    master_document= {jeff: {contact: {name: "Jeff Waltzer"}}, john: {contact: {name: "John Maxwell"}}}
    @doc= Nokogiri::HTML(IndexView.new(master_document).render)
  end

  it "has a link to jeff" do
    @doc.xpath("//a[@href='/jeff.html']").should have(1).element
  end
  
  it "has text in the link to jeff" do
    @doc.xpath("//a[@href='/jeff.html']/text()")[0].text().strip.should == "Jeff Waltzer"
  end
  
  it "has a link to john" do
    @doc.xpath("//a[@href='/john.html']").should have(1).element
  end

  it "has text in the link to john" do
    @doc.xpath("//a[@href='/john.html']/text()")[0].text().strip.should == "John Maxwell"
  end
end
