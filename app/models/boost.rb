class Boost < ActiveRecord::Base
	# belongs_to :boostcampaing ,class_name :boostcampaing ,foreign_key :campaing_id
	# belongs_to :boostcampaing ,foreign_key :"campaing_id"
	belongs_to :boostcampaing ,:foreign_key =>"campaing_id"
	# belongs_to :boostcampaing
	belongs_to :job
	belongs_to :user
	def self.boost_list( user_id , page )
		number = 5
		Boost.where("user_id =?", user_id).order( created_at: :DESC )
	      .page(page).per(number)
	end
	def self.get_list( page )
		number = 5
		Boost.order( created_at: :DESC )
	      .page(page).per(number)
	end
	# for admin company
	def self.edited_boosts( page )
		number = 5
		Boost.order( updated_at: :DESC ).page( page ).per( number )
	end
	# end admin company
	# for date time
	  def decorated_created_at
	    created_at.to_date.to_s( :long )
	  end
	# end datetime
end
