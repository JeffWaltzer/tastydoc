require_relative '../../tastydoc'
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'The TastyDocs app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'says hello' do
    get '/'
    last_response.should be_ok
    last_response.body.should == 'Hello, world'
  end
end
