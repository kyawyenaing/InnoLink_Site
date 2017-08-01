namespace :boosts do

  task update: :environment do 
    time = Date.today
    boosts = Boost.where("boosted_date = ? ", time)

    boosts.each do |boost|
      #job = Job.find(boost.job_id)
      #job.boost_start = boost.boosted_date
      #job.boost_end= boost.boosted_date
      #job.boost_budget = boost.daily_budget
      #job.status = 2
      #job.save

      puts "Your job id #{boost.id}"
      puts "Your job budget #{boost.daily_budget}"
    end
  end
end