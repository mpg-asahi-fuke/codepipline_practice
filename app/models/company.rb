class Company < ApplicationRecord
  has_many :ir_reports, dependent: :destroy

  validates :name, presence: true
  validates :number, presence: true
end
