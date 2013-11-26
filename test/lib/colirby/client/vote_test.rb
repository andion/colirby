describe Colirby::Client do

	let(:client){Colirby::Client}

  # Colibri endpoints
  # GET /api/v1/vote/ Retrieve a list of votes
  # 	Parameters:
  # 		limit		Specify the number of element to display per page.	int
	# 		offset		Specify the offset to start displaying element on a page.	int
	# 		member		ID of related resource	integer **THIS IS: the id of the member**
	# 		session_number		Integer data. **THIS IS: Like tue id of the session**
	# 		number		Integer data. - **THIS IS: Like tue id of the voting**
	#
  describe '.vote' do
		before do
      VCR.insert_cassette 'vote', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:vote){client.vote(3041955)}

		it "must fetch a vote if :id provided" do
			vote.id.must_equal 3041955
		end

		it "must have a related member" do
			vote.member.wont_be_empty
		end

		it "must have a related session" do
			vote.session_number.wont_be_nil
		end

		it "must paginate to 20 by default" do
			votes = client.vote(:member=> 1, :number => 1)
			votes.meta.limit.must_equal 20
			votes.objects.size.must_equal 20
		end

		it "must paginate" do
			votes = client.vote(:member=> 1, :number => 1, :limit => 10)
			votes.meta.limit.must_equal 10
			votes.meta.next.wont_be_nil
			votes.objects.size.must_equal 10
		end
  end


  # Colibri endpoints
  # GET /api/v1/vote/ Retrieve a list of vote_full. Unlike vote it does not need
  # 	any member or number (~= voting_number) paramenters
  #
  # 	Parameters:
  # 		limit		Specify the number of element to display per page.	int
	# 		offset		Specify the offset to start displaying element on a page.	int
	#
  describe '.vote_full' do #Weird. vote_full gets less info than .vote

		before do
      VCR.insert_cassette 'vote', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:vote_full){client.vote(3041955)}

		it "must fetch a vote if :id provided" do
				vote_full.id.must_equal 3041955
		end

		it "must paginate to 20 by default" do
			votes_full = client.vote_full
			votes_full.meta.limit.must_equal 20
			votes_full.objects.size.must_equal 20
		end

		it "must paginate" do
			votes_full = client.vote_full(:limit => 10)
			votes_full.meta.limit.must_equal 10
			votes_full.meta.next.wont_be_nil
			votes_full.objects.size.must_equal 10
		end

  end


  # Colibri endpoints
  # GET /api/v1/voting/ Retrieve a list of votings
  # 	Parameters:
  # 		limit		Specify the number of element to display per page.	int
	# 		offset		Specify the offset to start displaying element on a page.	int
	# 		member		ID of related resource	integer **THIS IS: the id of the member**
	# 		session__session		Integer data. Ex: 2673	integer
	# 		session__session__in		Integer data. Ex: 2673	integer
	#
  describe '.voting' do

		before do
      VCR.insert_cassette 'voting', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:voting){client.voting(1)}
		let(:votings){client.voting(:limit => 5)}

		it "must get a voting if :id provided" do
			voting.id.must_equal 1
		end

		it "must paginate" do
			votings.meta.limit.must_equal 5
			votings.objects.size.must_equal 5
		end
	end

  # Colibri endpoints
  # GET /api/v1/voting_full/ Retrieve a list of votings with the associated votes
  # 	Parameters:
  # 		limit		Specify the number of element to display per page.	int
	# 		offset		Specify the offset to start displaying element on a page.	int
	# 		member		ID of related resource	integer **THIS IS: the id of the member**
	# 		session__session		Integer data. Ex: 2673	integer
	# 		session__session__in		Integer data. Ex: 2673	integer
	#
	describe '.voting_full' do

		before do
			VCR.insert_cassette 'voting_full', :record => :new_episodes
		end

		after do
			VCR.eject_cassette
		end

		let(:voting_full){client.voting_full(1)}
		let(:votings_full){client.voting_full(:limit => 5)}

		it "must get a voting_full if :id provided" do
			voting_full.id.must_equal 1
		end

		it "must paginate" do
			votings_full.meta.limit.must_equal 5
			votings_full.objects.size.must_equal 5
		end
	end
end