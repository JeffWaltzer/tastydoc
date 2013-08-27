require_relative '../spec_helper'
require_relative '../../app/text_view'

describe "rendering an invalid document" do
  it "has the correct contact email" do
    master_document= {
      contact: {
        name: 42,
        email: 'joe@example.com'
      }
    }
    expect { TextView.new({}).render(master_document) }.to raise_error("Unknown document type: Fixnum")
  end
end
