class Tipper < ActiveRecord::Base
  belongs_to :user
  has_many :tips

  validates :standard_tip_amount, presence: true

  def update_standard_tip_amount(amount)
    self.standard_tip_amount = amount
    self.save
  end
end
