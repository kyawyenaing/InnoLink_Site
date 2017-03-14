class SalaryRange < ActiveRecord::Base

	# for api
	  def self.get_api(name)
	    City.order(created_at: :DESC)        
	  end
	# end api
end
