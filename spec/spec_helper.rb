require 'simplecov'
SimpleCov.start

def check_rendered_document(document, expected, view_class, username, style_sheet={})
  let :rendered_document do
    view = view_class.new(style_sheet)
    view.render(document, 'fake_username').split("\n")
  end

  expected= view_class.wrap_page(expected, username)

  it "has the correct number of lines" do
    rendered_document.size.should == expected.size
  end

  expected.each_with_index do |line, index|
    it "renders line #{index} as '#{line}'" do
      rendered_document[index].should == line
    end
  end
end
