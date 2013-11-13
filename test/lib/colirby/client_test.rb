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

  # Colibri endpoints
  #GET /api/v1/member/ Retrieve a list of members
  # Parameters:
  # limit		Specify the number of element to display per page.	int
  # offset		Specify the offset to start displaying element on a page.	int
  # name		Unicode string data. Ex: "Hello World"	string
  # name__startswith		Unicode string data. Ex: "Hello World"	string
  # name__iexact		Unicode string data. Ex: "Hello World"	string
  # name__istartswith		Unicode string data. Ex: "Hello World"	string
  # id		Integer data. Ex: 2673	integer
  #  
  #GET /api/v1/member/{id}/ Retrieve a single member by ID
  #
	describe ".member" do

		before do
      VCR.insert_cassette 'member', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:member){client.member(69)}

		it "gets the correct member if id provided" do
			member.id.must_equal 69
		end

		it "gets all members if no params provided" do
			client.member.objects.size.must_equal client.member.meta.total_count
		end

		it "paginates members if limit is set" do
			members = client.member(:limit => 20)
			members.objects.size.must_be :<=, 20
		end
  end

  # Colibri endpoints
  #GET /api/v1/group/ Retrieve a list of parlamentaries groups
  #
  # Parameters:
  # limit		Specify the number of element to display per page.	int
  # offset		Specify the offset to start displaying element on a page.	int
  # name		Unicode string data. Ex: "Hello World"	string
  # name__startswith		Unicode string data. Ex: "Hello World"	string
  # name__iexact		Unicode string data. Ex: "Hello World"	string
  # name__istartswith		Unicode string data. Ex: "Hello World"	string
  # id		Integer data. Ex: 2673	integer
  #
  #GET /api/v1/group/{id}/ Retrieve a single parlamentary group by ID
  # Parameters
  # id		Integer data. Ex: 2673	integer
  #  
  describe ".group" do
		#TODO: .group must return too the group members		

		before do
      VCR.insert_cassette 'group', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:group){client.group(1)}
		let(:partido_popular_group){client.group(:name => "G.P. Popular")}

		it "must get the right group if :id provided" do
			group.id.must_equal 1
		end

		it "must get the right group if :name provided" do
			partido_popular_group.objects.first.name.must_equal "G.P. Popular"
		end

		it "gets all groups if no params provided" do
			client.group.objects.size.must_equal client.group.meta.total_count
		end

		it "paginates groups if limit is set" do
			groups = client.group(:limit => 2)
			groups.objects.size.must_be :<=, 2
		end		
	end

  # Colibri endpoints
  #GET /api/v1/party/ Retrieve a list of parties
  #
  # Parameters:
  # limit		Specify the number of element to display per page.	int
  # offset		Specify the offset to start displaying element on a page.	int
  # name		Unicode string data. Ex: "Hello World"	string
  # name__startswith		Unicode string data. Ex: "Hello World"	string
  # name__iexact		Unicode string data. Ex: "Hello World"	string
  # name__istartswith		Unicode string data. Ex: "Hello World"	string
  # id		Integer data. Ex: 2673	integer
  #
  #GET /api/v1/party/{id}/ Retrieve a single party by ID
  # Parameters
  # id		Integer data. Ex: 2673	integer
  #  
	describe ".party" do
		before do
		   VCR.insert_cassette 'party', :record => :new_episodes
		end

		after do
			VCR.eject_cassette
		end
			
		let(:party){client.party(1)}
		let(:amaiur_party){client.party(:name => "AMAIUR")}

		it "must get the correct party" do
			party.id.must_equal 1
		end

		it "must get the correct party by name" do
			amaiur_party.objects.first.name.must_equal "AMAIUR"
		end
	end
end