json.array!(@boosts) do |boost|
  json.partial! 'preview', boost: boost
end
