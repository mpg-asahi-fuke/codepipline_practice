class CreateIrReports < ActiveRecord::Migration[8.0]
  def change
    create_table :ir_reports do |t|
      t.references :company,      null: false, foreign_key: true
      t.date       :published_at, null: false
      t.string     :title,        null: false
      t.text       :content,      null: true
      t.text       :url,          null: false
      t.timestamps
    end
  end
end
