json.extract! product, :id, :name, :description, :size, :brand, :color, :price_in_cents, :created_at, :updated_at
json.url product_url(product, format: :json)
