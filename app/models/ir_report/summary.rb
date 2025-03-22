class IrReport::Summary < ApplicationRecord
  belongs_to :ir_report, class_name: "IrReport", foreign_key: :ir_report_id

  validates :content,      presence: true
  validates :content_type, presence: true
end
