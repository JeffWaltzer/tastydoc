require 'spec_helper'
require_relative '../../app/html_view'

def html_page(body_html)
  "<html><head><linkhref='tastydoc.css'rel='stylesheet'type='text/css'></head><body>" +
    body_html +
    "</body></html>"
end

describe HtmlView do
  describe "when handed an empty document" do
    before do
      @html= HtmlView.new({ }).render({ })
      @html.gsub!(/\s+/, '')
    end

    it "is an HTML document" do
      @html.should == "<html><head><linkhref='tastydoc.css'rel='stylesheet'type='text/css'></head><body></body></html>"
    end
  end

  describe "when handed a document with one text item" do
    describe "with text_justification set to :center" do
      before do
        view = HtmlView.new({ some_text: :centered })
        @html= view.render({ some_text: "text" })
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
        view = HtmlView.new({ })
        @html= view.render({ some_text: "text",
                             more_text: "more text" })
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
        view = HtmlView.new({ content: :centered })
        @html= view.render({
                             content: {
                               some_text: "text",
                               more_text: "more text" }
                           })
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
      view= HtmlView.new({ history: 'history_entry' })
      html= view.render(
        {
          content: {
            history: ["did this",
                      "did that"]
          }
        }).gsub!(/\s+/, '')
      html.should == html_page("<divclass='history_entry'>didthis</div><divclass='history_entry'>didthat</div>")
    end
  end
end

describe HtmlView do
  describe "when passed a string" do
    it "wraps the string in a div" do
      pending
      HtmlView.new({}).render_content('content_name', "content").should == "<div>\n  content\n</div>\n"
    end
  end
end
