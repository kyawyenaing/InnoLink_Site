class Company < ActiveRecord::Base
	belongs_to :city 
	belongs_to :category

	validates_presence_of :name,:website,:category_id,:city_id,:address,:about

	# for user dashboard
	  def self.my_company(user_id, page = 1)
	    num_jobs = 5
	    Company.where(['user_id = ?', user_id])
	      .order(created_at: :DESC)
	      .page(page).per(num_jobs)
	  end
	# end user dashboard

	def self.get_list( page = 1)
		number = 5
		Company.order(created_at: :DESC).page(page).per(number)
	end

	# for date time
	  def decorated_created_at
	    created_at.to_date.to_s(:long)
	  end
	# end datetime

	# for api
	  # def self.get_api(name, page = 1)
	  # 	num_jobs = 5
	  #   Company.order(created_at: :DESC)
	  #   		.page(page).per(num_jobs) 
	  # end
	# end api

end
