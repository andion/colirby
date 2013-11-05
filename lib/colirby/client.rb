module Colirby

	# Client class
	# After reading: http://wynnnetherland.com/journal/what-makes-a-good-api-wrapper
	# 	decided to go with abstraction with this one and make the API more friendly
	class Client
		
		#Configuration. Separate into Colirby::Configuration if grows
		include HTTParty
		base_uri 	'http://proyectocolibri.es/api/v1'
		format :json

		# rubyify Colibri's django-like args
		# @example
		#   rubyify_arg('name__startswith') #=> 'name_startswith'
		#
		# @param arg [String,Symbol] the param to convert
		# @return [String,Symbol] a ruby-friendly parameter
		def self.rubyify_arg(arg)
			arg.to_s['__'] = '_'
			arg.is_a? Symbol ? arg.to_sym : arg
		end


		# Get a list of members / one member if :id provided
		#
		# @param options [Hash] options that /member can take.
		# 	see: {http://proyectocolibri.es/documentacion/#!/member/}
		# @return [Array<Hashie::Mash>] A Mash object with the +meta+ and the +objects+
		#
		def self.member(options={})			
			Hashie::Mash.new get('/member', :query => options)
		end

	end
end