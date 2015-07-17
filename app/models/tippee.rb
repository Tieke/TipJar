class Tippee < ActiveRecord::Base
  belongs_to :user
  has_many :tips
end
