require File.expand_path('../../lib/colirby.rb', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/colirby_cassettes'
  c.hook_into :webmock
end