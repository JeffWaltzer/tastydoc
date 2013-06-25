require 'spec_helper'
require_relative '../../app/new_html_view'

def html_page(body_html)
  "<html><head><linkhref='tastydoc.css'rel='stylesheet'type='text/css'></head><body>" +
    body_html +
    "</body></html>"
end

describe NewHtmlView do
  describe "when handed an empty document" do
    before do
      @html= NewHtmlView.new.render({ }, { })
      @html.gsub!(/\s+/, '')
    end

    it "is an HTML document" do
      @html.should == "<html><head><linkhref='tastydoc.css'rel='stylesheet'type='text/css'></head><body></body></html>"
    end
  end

  describe "when handed a document with one text item" do
    describe "with text_justification set to :center" do
      before do
        view = NewHtmlView.new
        @html= view.render({ some_text: "text" },
                           { some_text: :centered })
        @html.gsub!(/\s+/, '')
      end

      it "produces a text div with class 'center'" do
        @html.should == "<html><head><linkhref='tastydoc.css'rel='stylesheet'type='text/css'></head><body>" +
          "<divclass='centered'>text</div>" +
          "</body></html>"
      end
    end
  end

  describe "when handed a document with a nested item" do
    describe "with text_justification set to :center" do
      before do
        view = NewHtmlView.new
        @html= view.render({ some_text: "text",
                             more_text: "more text" },
                           { })
        @html.gsub!(/\s+/, '')
      end

      it "produces two text divs" do
        @html.should == "<html><head><linkhref='tastydoc.css'rel='stylesheet'type='text/css'></head><body>" +
          "<div>text</div>" +
          "<div>moretext</div>" +
          "</body></html>"
      end
    end
  end

  describe "when handed a document with two text items" do
    describe "with text_justification set to :center" do
      before do
        view = NewHtmlView.new
        @html= view.render({
                             content: {
                               some_text: "text",
                               more_text: "more text" }
                           },
                           { content: :centered })
        @html.gsub!(/\s+/, '')
      end

      it "produces a text div with class 'center'" do
        @html.should == html_page(
          "<divclass='centered'>" +
            "<div>text</div>" +
            "<div>moretext</div>" +
            "</div>")
      end
    end
  end

  describe "when handed a document with an array item" do
    it "produces two divs with the same class" do
      view= NewHtmlView.new
      html= view.render(
        {
          content: {
            history: ["did this",
                      "did that"]
          } },
        {history: 'history_entry' }).gsub!(/\s+/, '')
      html.should == html_page( "<divclass='history_entry'>didthis</div><divclass='history_entry'>didthat</div>")
    end
  end
end
