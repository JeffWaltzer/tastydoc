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

  it 'returns OK' do
    get '/resume.css'
    last_response.should be_ok
  end

  it 'is has content type of css' do
    get '/resume.css'
    last_response.headers['Content-Type'].should== "text/css;charset=utf-8"
  end
end
