# json.array!(@jobs) do |job|
# json.id @company.id
# json.name @company.name
# json.website @company.website
# json.category @company.category.name
# json.city @company.city.name
# json.address @company.address
# json.about @company.about
# json.created_at @company.created_at
# json.updated_at @company.updated_at

# json.title job.title
# json.job_type job.get_job_type
# json.category job.category.name
# json.salary_range job.salary_range.name
# json.city job.city.name
# json.description job.description
# json.requirement job.requirement
# json.how_to job.how_to
# json.created_at job.created_at
# json.updated_at job.updated_at
# end

json.array!(@jobs) do |job|
	json.job_id job.id
	json.job_title job.title
	json.job_company job.company.name
	json.job_city job.city.name
	json.job_type job.job_type
	json.job_created_at job.created_at
end
