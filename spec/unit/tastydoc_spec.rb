require_relative '../../app/tasty_document'

describe TastyDocument do
  describe "::build" do
    describe "called with a String" do
      it "creates a TastyStringNode"do
        TastyDocument.build("A String").should be_a(TastyStringNode)
      end
    end

    describe "called with a Hash" do
      it "creates a TastyHashNode"do
        TastyDocument.build({}).should be_a(TastyHashNode)
      end
    end

    describe "called with an Array" do
      it "creates a TastyArrayNode"do
        TastyDocument.build([]).should be_a(TastyArrayNode)
      end
    end

    describe "called with a Hash that specifies a link" do
      it "creates a TastyLinkNode"do
        TastyDocument.build({link: "foo"}).should be_a(TastyLinkNode)
      end
    end
  end
end