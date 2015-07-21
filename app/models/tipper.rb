class Tipper < ActiveRecord::Base
  belongs_to :user
  has_many :tips

  validates :standard_tip_amount, presence: true

   before_create do
    self.standard_tip_amount = 100
  end
  
end
