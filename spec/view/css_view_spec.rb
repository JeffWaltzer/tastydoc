require_relative '../spec_helper'
require_relative '../../app/css_view'


describe "CssView#render's result" do
  it "is a body CSS style" do
    css= CssView.new({ }).render({})
    css.should == "body {margin-left: 3%; margin-right: 7%;}"
  end
end


describe "A populated contact and summary" do
  before do
    master_document= {
      contact: {
        name: "Joe Smith",
      },
      summary: "Does all kinds of wonderful things."
    }
    @doc= CssView.new({}).render(master_document)
  end

  it "has the correct style for the contact div" do
    @doc.should include(".contact {text-align: center;}")
  end

  it "has the correct style for divs immediately under the contact div" do
    @doc.should include(".contact div {display: block;}")
  end

  it "has the correct style for the summary div" do
    @doc.should include(".summary {margin-top: 0.25cm; margin-left:0.25cm}")
  end
end

