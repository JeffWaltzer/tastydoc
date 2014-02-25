require_relative '../spec_helper'
require_relative '../../app/user_documents'

describe UserDocuments do
  before do
    stub_const('USER_DOCUMENTS', {fred: {resume: "fred's resume"}})
    @freds_docs= UserDocuments.new('fred')
  end

  it "exists" do
    @freds_docs.should be
  end

  describe '#pull_documents' do
    it "gives us back all of fred's documents" do
      @freds_docs.pull_documents.should == [
          {resume: "fred's resume"},
          {indented_sections:
               [:contact, :text,
                :projects, :jobs, :responsibilities,
                :clients],
           bulleted_sections:
               [:projects, :jobs, :responsibilities,
                :clients],
           seperated_sections:
               [:additional_info, :jobs, :experience,
                :development, :education, :skills,
                :summary, :contact],
           nobreak_sections: [:sitename]}]
    end
  end
end