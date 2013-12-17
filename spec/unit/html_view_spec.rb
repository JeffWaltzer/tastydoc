require 'spec_helper'
require_relative '../../app/html_view'

def html_page(body_html)
  "<html><head><linkhref='tastydoc.css'rel='stylesheet'type='text/css'></head><body><divclass='document'>" +
    body_html +
    "</div></body></html>"
end

describe "HtmlView#render" do
  describe "when handed an empty document" do
    before do
      @html= HtmlView.new({ }).render({ })
      @html.gsub!(/\s+/, '')
    end

    it "is an HTML document" do
      @html.should == html_page("")
    end
  end

  describe "when handed a document" do
    it "produces correctly indented HTML"
  end

  describe "when handed a document with one text item" do
    before do
      view = HtmlView.new({ })
      @html= view.render({ some_text: "text" })
      @html.gsub!(/\s+/, '')
    end

    it "produces a text div with class 'some_text'" do
      @html.should == html_page("<divclass='some_text'>text</div>")
    end
  end

  describe "when handed a document with a nested item" do
    describe "with text_justification set to :center" do
      before do
        view = HtmlView.new({ })
        @html= view.render({ some_text: "text",
                             more_text: "more text" })
        @html.gsub!(/\s+/, '')
      end

      it "produces two text divs" do
        @html.should == html_page("<divclass='some_text'>text</div>" +
                                    "<divclass='more_text'>moretext</div>")
      end
    end
  end

  describe "when handed a document with an array item" do
    it "produces two divs with the same class" do
      view= HtmlView.new({ })
      html= view.render(
        {
          content: {
            history: ["did this",
                      "did that"]
          }
        }).gsub!(/\s+/, '')
      html.should == html_page("<divclass='content'>" +
                                 "<divclass='history'>didthis</div>" +
                                 "<divclass='history'>didthat</div>" +
                                 "</div>")
    end
  end

  describe "when handed a link with no display text" do
    it "renders" do
      view= HtmlView.new({})
      html= view.render(
          {link: 'http://www.example.com'}
      ).gsub!(/\s+/, '')
      html.should == html_page("<ahref='http://www.example.com'>http://www.example.com</a>")
    end
  end

  describe "when handed a link with some display text" do
    it "renders" do
      view= HtmlView.new({})
      html= view.render(
          {text: 'Show Me', link: 'http://www.example.com'}
      ).gsub!(/\s+/, '')
      html.should == html_page("<ahref='http://www.example.com'>ShowMe</a>")
    end
  end
end

