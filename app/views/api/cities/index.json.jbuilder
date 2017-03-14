json.array!(@cities) do |city|
  json.partial! 'city_preview', city: city
end
