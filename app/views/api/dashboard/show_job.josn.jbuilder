json.array!(@jobs) do |job|
  json.job_id job.id
  json.job_title job.title
  json.job_city job.city.name
  json.job_created_at job.created_at
end

