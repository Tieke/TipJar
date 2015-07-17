class Tipper < ActiveRecord::Base
  belongs_to :user
  has_many :tips
end
