require_relative '../../app/tasty_document'

describe TastyDocument do
  describe "::build" do
    describe "called with a String" do
      before do
        @node= TastyDocument.build("A String")
      end

      it "creates a TastyStringNode"do
        @node.should be_a(TastyStringNode)
      end

      it "creates a TastyStringNode with the correct value"do
        @node.text.should == "A String"
      end
      it "creates a TastyStringNode with no children" do
        @node.children.size.should == 0
      end
    end

    describe "called with a Hash" do
      it "creates a TastyHashNode"do
        TastyDocument.build({}).should be_a(TastyHashNode)
      end
    end

    describe "called with an Array" do
      before do
        @node= TastyDocument.build(["One", "Two"])
      end

      it "creates a TastyArrayNode"do
        @node.should be_a(TastyArrayNode)
      end

      it "creates a TastyArrayNode with no text" do
        @node.text.should be_nil
      end

      it "creates a TastyArrayNode with two children" do
        @node.children.size.should == 2
      end

      describe "The first sub-node" do
        before do
          @sub_node= @node.children[0]
        end

        it "has the correct value" do
          @sub_node.text.should == "One"
        end
      end

      describe "The second sub-node" do
        before do
          @sub_node= @node.children[1]
        end

        it "has the correct value" do
          @sub_node.text.should == "Two"
        end
      end
    end

    describe "called with a Hash that specifies a link" do
      before do
        @node = TastyDocument.build({text: "go here",
                                     link: "http://foo.com"})
      end

      it "creates a TastyLinkNode" do
        @node.should be_a(TastyLinkNode)
      end

      it "creates a TastyLinkNode with the correct text" do
        @node.text.should == "go here"
      end

      it "creates a TastyLinkNode with the correct link target" do
        @node.link.should == "http://foo.com"
      end
    end

    describe "called with something else" do
      it "throws an exception" do
        expect {TastyDocument.build(Object.new)}.to raise_error("unexpected document type: Object")
      end
    end
  end
end

