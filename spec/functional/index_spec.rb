require_relative '../spec_helper'
require_relative '../../tastydoc'
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'The TastyDocs app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "root document" do
    it 'returns OK' do
      get '/'
      last_response.should be_ok
    end

    it 'is an html document' do
      get '/'
      last_response.headers['content-type'].should == 'text/html;charset=utf-8'
    end
  end
end
