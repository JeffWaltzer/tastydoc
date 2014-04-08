require_relative '../spec_helper'
require_relative '../../app/html_view'

describe "HtmlView#wrap_page" do
  it "wraps the page"
end

describe "HtmlView#render" do
  check_rendered_document({}, [], HtmlView, 'fake_username')

  describe "when handed a document with one text item" do
    check_rendered_document(
        {some_text: "text"},
        [
            "<div class='some_text'>",
            "  text",
            "</div>"
        ],
        HtmlView,
        'fake_username'
    )
  end

  describe "when handed a document with a nested item" do
    check_rendered_document(
        {
            some_text: "text",
            more_text: "more text"
        },
        [
            "<div class='some_text'>",
            "  text",
            "</div>",
            "<div class='more_text'>",
            "  more text",
            "</div>"
        ],
        HtmlView,
        'fake_username'
    )
  end

  describe "when handed a document with an array item" do
    check_rendered_document(
        {
            content: {
                history: ["did this",
                          "did that"]
            }
        },
        [
            "<div class='content'>",
            "  <div class='history'>",
            "    did this",
            "  </div>",
            "  <div class='history'>",
            "    did that",
            "  </div>",
            "</div>"
        ],
        HtmlView,
        'fake_username'
    )
  end

  describe "when handed a link with no display text" do
    check_rendered_document(
        {link: 'http://www.example.com'},
        [
            "<a href='http://www.example.com'>http://www.example.com</a>"
        ],
        HtmlView,
        'fake_username'
    )
  end

  describe "when handed a link with some display text" do
    check_rendered_document(
        {
            text: 'Show Me',
            link: 'http://www.example.com'
        },
        ["<a href='http://www.example.com'>Show Me</a>"],
        HtmlView,
        'fake_username'
    )
  end
end
