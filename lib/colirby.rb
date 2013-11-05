require 'httparty'
require 'hashie/mash'

module Colirby

	Dir[File.dirname(__FILE__) + '/colirby/*.rb'].each do |file|
	  require file
	end
end
