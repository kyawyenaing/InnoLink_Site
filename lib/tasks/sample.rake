require 'rake'

task :first_task => :environment do
  desc "TODO"
  # boosts = Job.all
  # boosts.each do |boost|
  #   puts "Calculating average rating for #{boost.title}..."
  #   # boost.update_attribute(:average_rating, boost.reviews.average("rating"))
  # end
  # boosts = Boost.last
  boosts = Boost.where("boosted_date ?=", date.now())
  # boosts.each do |boost|
  	job = Job.find(boosts.job_id)
  	job.boost_start = boosts.boosted_date
  	job.boost_end= boosts.boosted_date
  	job.boost_budget = boosts.daily_budget
  	job.save
  	puts "Your job #{job.title}"
  # end
end