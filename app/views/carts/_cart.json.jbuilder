json.extract! cart, :id, :balance, :completed_at, :created_at, :updated_at
json.url cart_url(cart, format: :json)
