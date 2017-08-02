require 'rake'



task :first_task => :environment do
  desc "TODO"
  # boosts = Job.all
  # boosts.each do |boost|
  #   puts "Calculating average rating for #{boost.title}..."
  #   # boost.update_attribute(:average_rating, boost.reviews.average("rating"))
  # end
  # boosts = Boost.last
  time = Date.today
  boosts = Boost.where("boosted_date =? ", time)
  boosts.each do |boost|
  	job = Job.find(boost.job_id)
  	job.boost_start = boost.boosted_date
  	job.boost_end= boost.boosted_date
  	job.boost_budget = boost.daily_budget
    job.status = 2
  	job.save

  	puts "Your job #{job.boost_budget}"
  end
end