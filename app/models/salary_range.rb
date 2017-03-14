class SalaryRange < ActiveRecord::Base

	# for api
	  def self.get_api(name)
	    SalaryRange.order(created_at: :DESC)        
	  end
	# end api
end
