class Tipper < ActiveRecord::Base
  belongs_to :user
  has_many :tips

  validates :standard_tip_amount, presence: true
end
