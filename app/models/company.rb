class Company < ActiveRecord::Base
	belongs_to :city 
	belongs_to :category
	belongs_to :user
	validates_presence_of :name,:website,:category_id,:city_id,:address,:about

	# for user dashboard
	  def self.my_company(user_id, page = 1)
	    num_jobs = 5
	    Company.where(['user_id = ?', user_id])
	      .order(created_at: :DESC)
	      .page(page).per(num_jobs)
	  end

	  def self.my_company_api(user_id)
	    Company.where(['user_id = ?', user_id])
	      .order(created_at: :DESC)
	  end
	# end user dashboard

	def self.get_list(page)
		number = 5
		Company.order(created_at: :DESC).page(page).per(number)
	end

	# for date time
	  def decorated_created_at
	    created_at.to_date.to_s(:long)
	  end
	# end datetime

	# for api
	  # def self.get_api()
	  #   Company.order(created_at: :DESC)
	  # end
	# end api

	# for api test for paginate
	  # def self.get_api( page = 1 )
	  # 	num = 5
	  #   Company.order(created_at: :DESC).page(page).per(num)
	  # end
	# end api

end
