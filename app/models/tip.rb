class Tip < ActiveRecord::Base
  belongs_to :tipper
  belongs_to :tippee

  validates :url, presence: true
  validates :amount, presence: true
end
