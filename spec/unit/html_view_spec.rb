require 'spec_helper'
require_relative '../../app/html_view'

def html_page(body_html)
  [
      "<html>",
      "  <head>",
      "    <link href='tastydoc.css' rel='stylesheet' type='text/css'>",
      "  </head>",
      "  <body>",
      "    <div class='document'>"
  ] +
      body_html.map { |line| ' '*6 + line } +
      [
          "    </div>",
          "  </body>",
          "</html>"
      ]
end

def check_html_document(document, expected, view_class, style_sheet={})
  let :rendered_document do
    view = view_class.new(style_sheet)
    view.render(document).split("\n")
  end

  it "has the correct number of lines" do
    rendered_document.size.should == html_page(expected).size
  end

  html_page(expected).each_with_index do |line, index|
    it "renders '#{line}'" do
      rendered_document[index].should == line
    end
  end
end

describe "HtmlView#render" do
  check_html_document({}, [], HtmlView)

  describe "when handed a document with one text item" do
    check_html_document(
        {some_text: "text"},
        [
            "<div class='some_text'>",
            "  text",
            "</div>"
        ],
        HtmlView
    )
  end

  describe "when handed a document with a nested item" do
    check_html_document(
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
        HtmlView
    )
  end

  describe "when handed a document with an array item" do
    check_html_document(
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
        HtmlView
    )
  end

  describe "when handed a link with no display text" do
    check_html_document(
        {link: 'http://www.example.com'},
        [
            "<a href='http://www.example.com'>http://www.example.com</a>"
        ],
        HtmlView
    )
  end

  describe "when handed a link with some display text" do
    check_html_document(
        {
            text: 'Show Me',
            link: 'http://www.example.com'
        },
        ["<a href='http://www.example.com'>Show Me</a>"],
        HtmlView
    )
  end
end
