json.array!(@messages) do |message|
  json.extract! message, :id, :title, :text, :father, :user, :minus_one, :number_answer
  json.url message_url(message, format: :json)
end
