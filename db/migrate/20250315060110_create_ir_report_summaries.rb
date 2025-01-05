class CreateIrReportSummaries < ActiveRecord::Migration[8.0]
  def change
    create_table :ir_report_summaries do |t|
      t.references :ir_report,    null: false, foreign_key: true
      t.text       :content,      null: false
      t.integer    :content_type, null: false
      t.timestamps
    end
  end
end
