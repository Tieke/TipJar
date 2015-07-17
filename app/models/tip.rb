class Tip < ActiveRecord::Base
  belongs_to :tipper
  belongs_to :tippee

  validates :url, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
