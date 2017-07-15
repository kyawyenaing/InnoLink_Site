class Boostcampaing < ActiveRecord::Base
	belongs_to :job
	enum status: { PENDING: 0, CONFIRM: 1}
	validates_presence_of :job_id, :start_date, :end_date, :status
end
