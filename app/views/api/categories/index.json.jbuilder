json.array!(@categories) do |category|
  json.partial! 'cat_preview', category: category
end
