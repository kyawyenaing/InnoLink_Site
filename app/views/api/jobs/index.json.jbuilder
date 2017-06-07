json.array!(@jobs) do |job|
	if @jobs 
  json.partial! 'job_preview', job: job
  	end
end
