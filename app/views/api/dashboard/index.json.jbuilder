  # json.company_id @company.id
  # json.company_name @company.name
  # json.company_website @company.website
  # json.company_city @company.city.name
  # json.company_created_at @company.created_at
json.array!(@companies) do |company|
  json.company_id company.id
  json.company_name company.name
  json.company_category company.category.name
  json.company_website company.website
  json.company_city company.city.name
  json.company_address company.address
  json.company_about company.about
  json.company_created_at company.created_at
end