class Job < ActiveRecord::Base

  belongs_to :city 
  belongs_to :category
  belongs_to :salary_range
  belongs_to :user
  belongs_to :company

  enum job_type: { FULLTIME: 0, PARTTIME: 1 , FREELANCE: 2, INTERNSHIP: 3 }
  enum status: { PENDING: 0, APPROVED: 1}
  validates_presence_of :title, :company_id, :job_type, 
    :category_id, :salary_range_id, :city_id, :description, :requirement, 
    :how_to,:status
    
# for admin approved jobs
  def self.pending_jobs( page = 1) 
    num_jobs = 5
    Job.where("status = ?",0).order( created_at: :DESC )
      .page( page ).per( num_jobs )
  end
# end admin approved jobs
# for admin approved jobs
  def self.edited_jobs( page = 1) 
    num_jobs = 5
    Job.where("status = ?",1).order( updated_at: :DESC )
      .page( page ).per( num_jobs )
  end
# end admin approved jobs

# for user dashboard
  def self.my_jobs(user_id, page = 1)
    num_jobs = 5
    Job.where(['user_id = ?', user_id])
      .order(created_at: :DESC)
      .page(page).per(num_jobs)
  end
# end user dashboard

# for job by company
  def self.comp_jobs( company_id, page = 1 )
    num_jobs = 5
    Job.where("status = ?",1).where(['company_id = ?', company_id])
      .order(created_at: :DESC)
      .page(page).per(num_jobs)
  end
# comp_jobs_count
  def self.comp_jobs_count( company_id )
    Job.where("status = ?",1).where(['company_id = ?', company_id])
      .order(created_at: :DESC)
      .count
  end
# end comp_jobs_count

###################################### Old Job List ###################################

# for job display and filter
  # def self.get_list( title, city_id, page = 1)
  #   num_jobs =  5

  #   if title == nil && city_id == nil
  #   Job.where("status = ?",1).order(updated_at: :DESC)
  #       .page(page).per(num_jobs)
  #   else
  #     if title != "" && city_id != ""
  #         Job.where("status = ?",1).where(['title LIKE ? && city_id = ?', title, city_id])
  #           .order(updated_at: :DESC)
  #           .page(page).per(num_jobs)
  #     end
  #     if title != ""
  #       Job.where("status = ?",1).where(['title LIKE ?', title])
  #         .order(updated_at: :DESC)
  #         .page(page).per(num_jobs)
  #     else
  #       Job.where("status = ?",1).where(['city_id = ?', city_id])
  #         .order(updated_at: :DESC)
  #         .page(page).per(num_jobs)
  #     end
  #   end
  # end
# end job display and filter

###################################### Old Job List ###################################

# for job display and filter
  def self.get_list( title, city_id, page = 1)
    num_jobs =  5

    if title == nil && city_id == nil
    Job.where("status = ?",1).order(updated_at: :DESC)
        .page(page).per(num_jobs)
    else
      if title != ""
        if city_id != ""
          Job.where("status = ?",1).where(['title LIKE ? and city_id = ?', title, city_id])
                      .order(updated_at: :DESC)
                      .page(page).per(num_jobs)
        else
        Job.where("status = ?",1).where(['title LIKE ?', title])
          .order(updated_at: :DESC)
          .page(page).per(num_jobs)
        end
      else
        Job.where("status = ?",1).where(['city_id = ?', city_id])
          .order(updated_at: :DESC)
          .page(page).per(num_jobs)
      end
    end

  end
# end job display and filter

# for date time
  def decorated_created_at
    created_at.to_date.to_s(:long)
    # created_at.strftime "%d/%m/%Y %H:%M"
  end
# end datetime
# for date time
  def decorated_updated_at
    updated_at.to_date.to_s(:long)
    # created_at.strftime "%d/%m/%Y %H:%M"
  end
# end datetime

##################################################### Old Job Count#####################
  # def self.get_count( title, city_id)

  #   if title == nil && city_id == nil
  #   Job.where("status = ?",1).order(created_at: :DESC)
  #       .count
  #   else
  #     if title != "" && city_id != ""
  #         Job.where("status = ?",1).where(['title LIKE ? and city_id = ?', title, city_id])
  #           .order(created_at: :DESC)
  #           .count
  #     end
  #     if title != ""
  #       Job.where("status = ?",1).where(['title LIKE ?', title])
  #         .order(created_at: :DESC)
  #         .count
  #     else
  #       Job.where("status = ?",1).where('city_id = ?', city_id)
  #         .order(created_at: :DESC)
  #         .count
  #     end
  #   end

  # end

##################################################### Old Job Count#####################

  def self.get_count( title, city_id )
    if title == nil && city_id == nil
    Job.where("status = ?",1).order(updated_at: :DESC)
        .count
    else
      if title != ""
        if city_id != ""
          Job.where("status = ?",1).where(['title LIKE ? and city_id = ?', title, city_id])
                      .order(updated_at: :DESC)
                      .count
        else
        Job.where("status = ?",1).where(['title LIKE ?', title])
          .order(updated_at: :DESC)
          .count
        end
      else
        Job.where("status = ?",1).where(['city_id = ?', city_id])
          .order(updated_at: :DESC)
          .count
      end
    end

  end

end
