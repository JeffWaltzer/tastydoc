ENV['GEM_HOME']='/home/jeffwaltzer/.rvm/gems/ruby-1.9.3-p374@tastydoc'
ENV['GEM_PATH']='/home/jeffwaltzer/.rvm/gems/ruby-1.9.3-p374@tastydoc:/home/jeffwaltzer/.rvm/gems/ruby-1.9.3-p374@global'

Gem.clear_paths

require 'bundler'
Bundler.require

require "tastydoc"
run Sinatra::Application