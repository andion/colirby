require_relative '../../test_helper'

require_relative './client/member_group_party_test'
require_relative './client/vote_test'
require_relative './client/commission_initiative_session_test'

describe Colirby::Client do

	let(:client){Colirby::Client}

  describe "default attributes" do

  	it "must include httparty methods" do
    	client.must_include HTTParty
  	end

  	it "must have the base url set to Colibri's endpoint" do
    	client.base_uri.must_equal 'http://proyectocolibri.es/api/v1'
  	end
	end

end