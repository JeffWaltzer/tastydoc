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

  it 'returns OK for html' do
    get '/jeffwaltzer.html'
    last_response.should be_ok
  end

  it 'returns OK for text' do
    get '/jeffwaltzer.txt'
    last_response.should be_ok
  end

  it 'is an html document' do
    get '/jeffwaltzer.html'
    last_response.body.should include 'Jeff'
  end

  it 'defaults to HTML' do
    get '/jeffwaltzer'
    last_response.body.should include 'Jeff'
  end

  it 'does not have doc id' do
    get '/jeffwaltzer.html'
    last_response.body.should_not include "'jeffwaltzer'"
  end

  it 'is an html document' do
    get '/johnmaxwell.html'
    last_response.body.should include 'John'
  end

  it 'has deeply nested content' do
    get '/jeffwaltzer.html'
    last_response.body.should include 'Applied Test Driven Development to legacy code'
  end
end
