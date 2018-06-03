class AddStatusCodeToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :website_status, :string
  end
end
