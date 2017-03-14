class City < ActiveRecord::Base
	
  def self.get_list
    City.order('LOWER(name) ASC')
  end
  # for api
    def self.get_api(name)
      City.order(created_at: :DESC)        
    end
  # end api
end
