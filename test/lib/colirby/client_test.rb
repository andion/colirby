require_relative '../../test_helper'

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
	
	describe ".member" do

		before do
      VCR.insert_cassette 'member', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:member){client.member(:id => 69)}

		it "gets one member if :id is provided" do
	  	member.objects.size.must_equal 1
		end


		it "gets the correct member if :id provided" do
			member.objects.first.id.must_equal 69
		end

		it "gets all members if no params provided" do
			client.member.objects.size.must_equal client.member.meta.total_count
		end

		it "paginates members if limit is set" do
			members = client.member(:limit => 20)
			members.objects.size.must_be :<=, 20
		end
  end	
end