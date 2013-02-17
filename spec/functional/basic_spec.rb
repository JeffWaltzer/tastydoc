require_relative '../../tastydoc'
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'The TastyDocs app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'returns OK' do
    get '/'
    last_response.should be_ok
  end

  it 'is an html document' do
    pending
    get '/'
    last_response.body.should include 'html'
  end
end
