class IrReport < ApplicationRecord
  belongs_to :company
  has_many   :ir_report_summaries, class_name: "IrReport::Summary", dependent: :destroy

  validates :title,        presence: true
  validates :content,      presence: true
  validates :published_at, presence: true
  validates :url,          presence: true
end
