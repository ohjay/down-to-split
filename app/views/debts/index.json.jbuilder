json.array!(@debts) do |debt|
  json.extract! debt, :id, :cost, :creditor_id, :debtor_id
  json.url debt_url(debt, format: :json)
end
