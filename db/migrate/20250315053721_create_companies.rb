class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.integer :number, null: false 
      t.string  :name,   null: false 
      t.timestamps
    end
  end
end
