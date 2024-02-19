# spec/support/simplecov.rb
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/spec/'
end
