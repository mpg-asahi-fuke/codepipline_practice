class IrReport < ApplicationRecord
  belongs_to :company
  has_many   :ir_report_summaries, dependent: :destroy

  validates :title,        presence: true
  validates :content,      presence: true
  validates :published_at, presence: true
  validates :url,          presence: true  
end
