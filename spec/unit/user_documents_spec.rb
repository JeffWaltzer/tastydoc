require_relative '../spec_helper'
require_relative '../../app/user_documents'

describe UserDocuments do
  describe "using the default style sheet" do
    before do
      stub_const('USER_DOCUMENTS',
                 {fred: {resume: "fred's resume"},
                  defaults: {
                    style_sheet: {}}})
      @freds_docs= UserDocuments.new('fred')
    end

    it "exists" do
      @freds_docs.should be
    end

    describe '#pull_documents' do
      it "gives us back all of fred's documents" do
        @freds_docs.pull_documents.should ==
            {
                resume: "fred's resume",
              style_sheet: {}
            }
      end
    end
  end

  describe "using a private style sheet" do
    before do
      stub_const('USER_DOCUMENTS',
                 {fred: {resume: "fred's resume",
                         style_sheet: {private_style: true}},
                  defaults: {style_sheet: {}}})
      @freds_docs= UserDocuments.new('fred')
    end

    describe '#pull_documents' do
      it "gives us back all of fred's documents" do
        @freds_docs.pull_documents.should ==
            {
                resume: "fred's resume",
                style_sheet: {private_style: true}
            }
      end
    end
  end
end