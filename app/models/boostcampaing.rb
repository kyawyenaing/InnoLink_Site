class Boostcampaing < ActiveRecord::Base
	belongs_to :job
	belongs_to :user
	enum status: { REQUEST_TO_BOOST: 0, CONFIRM: 1}
	validates_presence_of :job_id, :start_date, :end_date, :status

	def self.get_list( page )
		number = 5
		Boostcampaing.where("status =?", 0).order( created_at: :DESC )
	      .page(page).per(number)
	end

	def self.coming_boost( user_id , page )
		number = 5
		Boostcampaing.where("user_id =?", user_id).order( created_at: :DESC )
	      .page(page).per(number)
	end

	# for admin company
	def self.edited_campaings( page )
		number = 5
		Boostcampaing.order( updated_at: :DESC ).page( page ).per( number )
	end
	# end admin company

	# for date time
	  def decorated_created_at
	    created_at.to_date.to_s( :long )
	  end
	# end datetime
	# for date time
	  def decorated_updated_at
	    updated_at.to_date.to_s(:long)
	    # created_at.strftime "%d/%m/%Y %H:%M"
	  end
	# end datetime
end
