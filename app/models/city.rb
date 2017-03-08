class City < ActiveRecord::Base

  def self.get_list
    City.order('LOWER(name) ASC')
  end
end
