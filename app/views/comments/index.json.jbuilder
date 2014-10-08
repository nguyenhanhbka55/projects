json.array!(@comments) do |comment|
  json.extract! comment, :id, :post_id, :commente
  json.url comment_url(comment, format: :json)
end
