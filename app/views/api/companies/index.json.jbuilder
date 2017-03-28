json.array!(@companies) do |company|
  json.partial! 'company_preview', company: company
end
