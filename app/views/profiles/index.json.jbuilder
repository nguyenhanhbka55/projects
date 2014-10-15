json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :avatar, :resume
  json.url profile_url(profile, format: :json)
end
