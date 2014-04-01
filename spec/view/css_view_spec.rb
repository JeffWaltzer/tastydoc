require_relative '../spec_helper'
require_relative '../../app/css_view'


describe "CssView#render's result" do
  before do
    @css= CssView.new({ }).render({})
  end

  it "isn't nil" do
    @css.should be
  end

  it "is blank" do
    @css.should == ''
  end
end
