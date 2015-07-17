class Tip < ActiveRecord::Base
  validates :url, presence: true
  validates :amount, presence: true
end
