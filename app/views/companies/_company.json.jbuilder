json.extract! company, :id, :company_name, :contact, :phone, :address, :website, :created_at, :updated_at
json.url company_url(company, format: :json)
