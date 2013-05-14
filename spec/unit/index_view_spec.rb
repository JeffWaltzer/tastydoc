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

  it "has a label for Jeff's resume" do
    @doc.xpath("//span[contains(.,'Jeff Waltzer')]").should have(1).element
  end

  it "has a label for John's resume" do
    @doc.xpath("//span[contains(.,'John Maxwell')]").should have(1).element
  end

  it "has a link to the html version of jeff's resume" do
    @doc.xpath("//a[@href='/jeff.html']").should have(1).element
  end

  it "has text in the link to the html version of jeff's resume" do
    @doc.xpath("//a[@href='/jeff.html']/text()")[0].text().strip.should == "as html"
  end

  it "has a link to the html version of john's resume" do
    @doc.xpath("//a[@href='/john.html']").should have(1).element
  end

  it "has text in the link to the html version of john's resume" do
    @doc.xpath("//a[@href='/john.html']/text()")[0].text().strip.should == "as html"
  end

  it "has a link to the text version of Jeff's resume" do
    @doc.xpath("//a[@href='/jeff.txt']").should have(1).element
  end

  it "has text in the link to the text version of jeff's resume" do
    @doc.xpath("//a[@href='/john.txt']/text()")[0].text().strip.should == "as text"
  end

  it "has a link to the text version of John's resume" do
    @doc.xpath("//a[@href='/john.txt']").should have(1).element
  end

  it "has text in the link to the text version of John's resume" do
    @doc.xpath("//a[@href='/john.txt']/text()")[0].text().strip.should == "as text"
  end
end
