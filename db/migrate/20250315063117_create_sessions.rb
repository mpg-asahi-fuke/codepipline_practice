class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :ip_address
      t.string :admin_agent

      t.timestamps
    end
  end
end
