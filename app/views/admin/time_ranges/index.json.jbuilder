json.array!(@admin_time_ranges) do |admin_time_range|
  json.extract! admin_time_range, :id
  json.url admin_time_range_url(admin_time_range, format: :json)
end
