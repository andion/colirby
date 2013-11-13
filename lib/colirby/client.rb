module Colirby

	# Client class
	# After reading: http://wynnnetherland.com/journal/what-makes-a-good-api-wrapper
	# 	decided to make two clients one wrapping exactly the original one and one more
	# 	ruby-friendly
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


		# Get a list of members / one member if id provided
		#
		# @param options [Hash,Integer] options that /member can take or an id.
		# 	see: {http://proyectocolibri.es/documentacion/#!/member/}
		# @return [Array<Hashie::Mash>] A Mash object with the +meta+ and the +objects+ or
		# 	a Mash with the group info if options is a id
		#
		def self.member(options={})
			client_get 'member', options
		end

		# Get a list of groups / one group if id provided
		#
		# @param options [Hash,Fixnum] options that /group can take or an id.
		# 	see: {http://proyectocolibri.es/documentacion/#!/group/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+ and the +objects+ or
		# 	a Mash with the group info if options is a id
		#
		def self.group(options={})
			client_get 'group', options
		end

		# Get a list of groups / one group if id provided
		#
		# @param options [Hash,Fixnum] options that /party can take or an id.
		# 	see: {http://proyectocolibri.es/documentacion/#!/party/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+ and the +objects+ or
		# 	a Mash with the party info if options is a id
		#
		def self.party(options={})
			client_get 'party', options
		end

		private

		def self.client_get(resource_name,options={})
			if options.kind_of? Integer
				Hashie::Mash.new get "/#{resource_name}/#{options}"
			else			
				Hashie::Mash.new get "/#{resource_name}", :query => options
			end
		end

	end
end