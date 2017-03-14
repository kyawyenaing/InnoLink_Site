class Category < ActiveRecord::Base

	# for api
	  def self.get_api( name)
	    Category.order(created_at: :DESC)        
	  end
	# end api
end
