class Company < ActiveRecord::Base
	belongs_to :city 
	belongs_to :category

	validates_presence_of :name,:website,:category_id,:city_id,:address,:about

	def self.get_list( category_id, city_id, page = 1 )
		number = 1;
		Company.order(created_at: :DESC).page(page).per(number)
	end

	# for date time
	  def decorated_created_at
	    created_at.to_date.to_s(:long)
	  end
	# end datetime

	# for api
	  def self.get_api(name)
	    Company.order(created_at: :DESC)        
	  end
	# end api
end
