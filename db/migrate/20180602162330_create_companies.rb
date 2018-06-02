class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :contact
      t.string :phone
      t.string :address
      t.string :website

      t.timestamps
    end
  end
end
