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

		# Get a list of members with a link to their party
		#
		# @param options [Hash,Integer] options that /groupmember can take or an id.
		# 	see: {http://proyectocolibri.es/documentacion/#!/groupmember/}
		# @return [Array<Hashie::Mash>] A Mash object with the +meta+ and the +objects+ or
		# 	a Mash with the groupember info if options is a id
		#
		def self.groupmember(options={})
			client_get 'member', options
		end

		# Get a list of groups / one group if id provided. It also gets the group's members
		#
		# @param options [Hash,Fixnum] options that /group can take or an id.
		# 	see: {http://proyectocolibri.es/documentacion/#!/group/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+ and the +objects+ or
		# 	a Mash with the group info if options is a id
		#
		def self.group(options={})
			client_get 'group', options
		end

		# Get a list of groups / one group if id provided. It does not get the group's members
		#
		# @param options [Hash,Fixnum] options that /group can take or an id.
		# 	see: {http://proyectocolibri.es/documentacion/#!/group/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+ and the +objects+ or
		# 	a Mash with the group info if options is a id
		#
		def self.simple_group(options={})
			client_get 'simple_group', options
		end

		# Get a list of groups / one group if id provided
		#
		# @param options [Hash,Fixnum] options that /party can take or an id.
		# 	see: {http://proyectocolibri.es/documentacion/#!/party/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+
		# 	and the +objects+ or a Mash with the party info if options is an id
		#
		def self.party(options={})
			client_get 'party', options
		end

		# Get a vote with the specified id / options
		#
		# @param options [Hash,Fixnum] same options as Colibri's endpoing or vote's id
		# 	see: {http://proyectocolibri.es/documentacion/#!/vote/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+
		# 	and the +objects+ or a Mash with the vote info if options is an id
		#
		def self.vote(options={})
			client_get 'vote', options
		end

		# Get a vote_full with the specified id / options
		#
		# @param options [Hash,Fixnum] same options as Colibri's endpoing or vote_full's id
		# 	see: {http://proyectocolibri.es/documentacion/#!/vote_full/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+
		# 	and the +objects+ or a Mash with the vote_full info if options is an id
		#
		def self.vote_full(options={})
			client_get 'vote_full', options
		end

		# Get a voting with the specified id / options
		#
		# @param options [Hash,Fixnum] same options as Colibri's endpoing or voting's id
		# 	see: {http://proyectocolibri.es/documentacion/#!/voting/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+
		# 	and the +objects+ or a Mash with the voting info if options is an id
		#
		def self.voting(options={})
			client_get 'voting', options
		end

		# Get a voting_full with the specified id / options
		#
		# @param options [Hash,Fixnum] same options as Colibri's endpoing or vote_full's id
		# 	see: {http://proyectocolibri.es/documentacion/#!/voting_full/}
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+
		# 	and the +objects+ or a Mash with the voting_full info if options is an id
		#
		def self.voting_full(options={})
			client_get 'voting_full', options
		end


		private

		# Make a proper request if :id is provided /resource_name/:id
		#
		# @param resource_name [String, Symbol] Colibri's resource name
		# @param options [Hash] Colibri's options
		# @return [Array<Hashie::Mash>,<Hashie::Mash>] A Mash object with the +meta+
		# 	and the +objects+ or a Mash with the object info if options is an id
		#
		# @todo HTTP error handling
		#
		def self.client_get(resource_name,options={})
			if options.kind_of? Integer
				Hashie::Mash.new get "/#{resource_name}/#{options}"
			else
				Hashie::Mash.new get "/#{resource_name}", :query => options
			end
		end

	end
end