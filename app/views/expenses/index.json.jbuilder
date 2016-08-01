json.array!(@expenses) do |expense|
  json.extract! expense, :id, :percentage, :purchase_id, :user_id
  json.url expense_url(expense, format: :json)
end
