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

  describe "when handed a document with one text item" do
    before do
      view = HtmlView.new({})
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
        view = HtmlView.new({})
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
      view= HtmlView.new({})
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
end

describe "HtmlView#render_content" do
  describe "when passed a string" do
    it "wraps the string in a div" do
      HtmlView.new({}).render_content('content_name', "content").should == "<div class='content_name'>\n  content\n</div>\n"
    end
  end

  describe "when handed two text items" do
    before do
      view = HtmlView.new({})
      @html= view.render_content(:content, {
                                     some_text: "text",
                                     more_text: "more text" }
                                 )
    end

    it "produces a suitably indent set of divs and strings" do
      @html.should ==
        "<div class='content'>\n" +
        "  <div class='some_text'>\n" +
        "    text\n" +
        "  </div>\n" +
        "  <div class='more_text'>\n" +
        "    more text\n" +
        "  </div>\n" +
        "</div>\n"
    end
  end
end
