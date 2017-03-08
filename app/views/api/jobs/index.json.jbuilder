
json.array!(@jobs) do |job|
  json.partial! 'job_preview', job: job
end