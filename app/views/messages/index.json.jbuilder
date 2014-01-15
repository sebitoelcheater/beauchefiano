json.array!(@messages) do |message|
  json.extract! message, :id, :title, :text, :message_id, :user_id, :date, :category, :dislikes, :permalink
  json.url message_url(message, format: :json)
end
