describe Colirby::Client do

	let(:client){Colirby::Client}

  # Colibri endpoints
  # GET /api/v1/commision/ Retrieve a list of commisions
  # 	Parameters:
  # 		limit		Specify the number of element to display per page.	int. Default:20
	# 		offset		Specify the offset to start displaying element on a page.	int
	#
  describe '.commission' do
		before do
      VCR.insert_cassette 'commission', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:commission){client.commission(324549)}

		it 'must get one commission if :id provided' do
		  commission.id.must_equal 324549
		end

		it "must paginate to 20 by default" do
			commissions = client.commission
			commissions.meta.limit.must_equal 20
			commissions.objects.size.must_equal 20
		end

		it "must paginate" do
			commissions = client.commission(:limit => 10)
			commissions.meta.limit.must_equal 10
			commissions.meta.next.wont_be_nil
			commissions.objects.size.must_equal 10
		end

	end

  # Colibri endpoints
  # GET /api/v1/initiative/ Retrieve a list of initiatives
  # 	Parameters:
  # 		limit		Specify the number of element to display per page.	int. Default:20
	# 		offset		Specify the offset to start displaying element on a page.	int
	# 		authors_group__name		Unicode string data. Ex: "Hello World"	string
	# 		authors_group__name__startswith		Unicode string data. Ex: "Hello World"	string
	# 		authors_group__name__iexact		Unicode string data. Ex: "Hello World"	string
	# 		authors_group__name__istartswith		Unicode string data. Ex: "Hello World"	string
	# 		authors_group__id		Integer data. Ex: 2673	integer
	# 		votings__session__session		Integer data. Ex: 2673	integer
	# 		votings__session__session__in		Integer data. Ex: 2673	integer
	# 		authors__id		Integer data. Ex: 2673	integer
	# 		authors__name		Unicode string data. Ex: "Hello World"	string
	# 		authors__name__startswith		Unicode string data. Ex: "Hello World"	string
	# 		authors__name__iexact		Unicode string data. Ex: "Hello World"	string
	# 		authors__name__istartswith		Unicode string data. Ex: "Hello World"	string
	# 		authors__second_name		Unicode string data. Ex: "Hello World"	string
	# 		authors__second_name__startswith		Unicode string data. Ex: "Hello World"	string
	# 		authors__second_name__iexact		Unicode string data. Ex: "Hello World"	string
	# 		authors__second_name__istartswith		Unicode string data. Ex: "Hello World"	string
	#
  describe '.initiative' do
		before do
      VCR.insert_cassette 'initiative', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end

		let(:initiative){client.initiative(1)}

		it 'must get one initiative if :id provided' do
		  initiative.id.must_equal 1
		end

		it "must paginate to 20 by default" do
			initiatives = client.initiative
			initiatives.meta.limit.must_equal 20
			initiatives.objects.size.must_equal 20
		end

		it "must paginate" do
			initiatives = client.initiative(:limit => 10)
			initiatives.meta.limit.must_equal 10
			initiatives.meta.next.wont_be_nil
			initiatives.objects.size.must_equal 10
		end

	end

  # Colibri endpoints
  # GET /api/v1/session/ Retrieve a list of sessions
  # 	Parameters:
  # 		limit		Specify the number of element to display per page.	int. Default:20
	# 		offset		Specify the offset to start displaying element on a page.	int
	# 		session		Integer data. Ex: 2673	integer
	# 		session__in		Integer data. Ex: 2673	integer
	# 		order_by		Orders the result set based on the selection. Currently date and -date(descending)
	#
  describe '.session' do
		before do
      VCR.insert_cassette 'session', :record => :new_episodes
    end

    after	do
    	VCR.eject_cassette
		end


		let(:session){client.session(1)}

		it 'must get one session if :id provided' do
		  session.id.must_equal 1
		end

		it "must paginate to 20 by default" do
			sessions = client.session
			sessions.meta.limit.must_equal 20
			sessions.objects.size.must_equal 20
		end

		it "must paginate" do
			sessions = client.session(:limit => 10)
			sessions.meta.limit.must_equal 10
			sessions.meta.next.wont_be_nil
			sessions.objects.size.must_equal 10
		end
	end
end