json.array!(@jobs) do |job|
json.company_name @company.name
json.company_website @company.website
json.company_category @company.category.name
json.company_city @company.city.name
json.company_address @company.address
json.company_about @company.about
json.company_created_at @company.created_at
json.company_updated_at @company.updated_at

json.job_id job.id
json.job_title job.title
json.job_job_type job.get_job_type
json.job_category job.category.name
json.job_salary_range job.salary_range.name
json.job_city job.city.name
json.job_description job.description
json.job_requirement job.requirement
json.job_how_to job.how_to
json.job_created_at job.created_at
json.job_updated_at job.updated_at
end
