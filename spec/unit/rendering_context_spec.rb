require 'rspec'

describe RenderingContext do
  describe "#render_document" do
    describe "when passed a string" do
      it "wraps the string in a div" do
        @html= RenderingContext.new(
            HtmlView.new({}),
            'content_name',
            "content",
            0).render_document
        @html.should == "<div class='content_name'>\n  content\n</div>\n"
      end
    end

    describe "when handed two text items" do
      before do
        context = RenderingContext.new(
            HtmlView.new({}),
            :content,
            {some_text: "text",
             more_text: "more text"},
            0)
        @html= context.render_document
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

    describe "links without text" do
      before do
        context = RenderingContext.new(
            HtmlView.new({}),
            :link,
            {link: "http://example.com/stuff.html"},
            0)
        @html= context.render_document
      end

      it "renders" do
        @html.should ==
            "<div class='link'>\n" +
                "  <a href='http://example.com/stuff.html'>http://example.com/stuff.html</a>\n" +
                "</div>\n"
      end
    end

    describe "when handed a mailto item" do
      before do
        context = RenderingContext.new(
            HtmlView.new({}),
            :email,
            {
                link: "mailto:jeff@example.com",
                text: "example"
            },
            0
        )
        @html= context.render_document
      end

      it "renders" do
        @html.should ==
            "<div class='email'>\n" +
                "  <a href='mailto:jeff@example.com'>example</a>\n" +
                "</div>\n"
      end
    end
  end
end