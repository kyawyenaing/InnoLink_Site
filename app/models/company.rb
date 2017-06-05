class Company < ActiveRecord::Base
	belongs_to :city 
	belongs_to :category
	belongs_to :user
	validates_presence_of :name,:website,:category_id,:city_id,:address,:about

	# for admin company
	def self.edited_companies( page )
		number = 5
		Company.order( updated_at: :DESC ).page( page ).per( number )
	end
	# end admin company
	# for user dashboard
	  def self.my_company( user_id, page = 1 )
	    num_jobs = 5
	    Company.where( ['user_id = ?', user_id] )
	      .order( created_at: :DESC )
	      .page(page).per(num_jobs)
	  end
	# end user dashboard
	# for home and api
	def self.get_list( page )
		number = 5
		Company.order( created_at: :DESC ).page( page ).per( number )
	end
	# end home and api
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
