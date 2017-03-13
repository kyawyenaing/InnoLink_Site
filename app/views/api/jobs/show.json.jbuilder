json.id @job.id
json.title @job.title
json.company_name @job.company_name
json.company_website @job.company_website
json.job_type @job.get_job_type
json.category @job.category.name
json.salary_range @job.salary_range.name
json.city @job.city.name
# json.city_id @job.city_id
json.description @job.description
json.requirement @job.requirement
json.how_to @job.how_to
