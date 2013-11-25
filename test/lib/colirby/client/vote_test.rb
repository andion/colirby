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

		it "must fetch the correct vote" do
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

  describe '.vote_full' do
  	#fuckoff
  end

  describe '.voting' do
  end

  # voting & votes
  describe '.voting_full' do
  	#fuckoff
  end

end