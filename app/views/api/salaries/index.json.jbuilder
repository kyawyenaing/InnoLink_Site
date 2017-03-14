json.array!(@salaries) do |salary|
  json.partial! 'salary_preview', salary: salary
end
